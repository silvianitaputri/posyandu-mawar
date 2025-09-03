import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesViewer extends StatefulWidget {
  const SharedPreferencesViewer({super.key});

  @override
  State<SharedPreferencesViewer> createState() => _SharedPreferencesViewerState();
}

class _SharedPreferencesViewerState extends State<SharedPreferencesViewer> {
  Map<String, Object> _prefsData = {};
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    final Map<String, Object> data = {};
    for (var key in keys) {
      final value = prefs.get(key);
      if (value != null) data[key] = value;
    }

    setState(() => _prefsData = data);
  }

  Future<void> _removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    _loadPrefs();
  }

  Future<void> _clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _loadPrefs();
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = _prefsData.entries
        .where((entry) => entry.key.contains(_searchQuery))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Viewer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: "Hapus Semua",
            onPressed: _clearAll,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Cari Key",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.pink.shade100),
                  columns: const [
                    DataColumn(label: Text('Key', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Value', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Aksi', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: filteredData.map((entry) {
                    return DataRow(
                      cells: [
                        DataCell(Text(entry.key)),
                        DataCell(Text(entry.value.toString())),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeKey(entry.key),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
