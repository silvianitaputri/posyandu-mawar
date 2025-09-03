import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/ketua_tindak.dart';

class KetuaLanjutan extends StatefulWidget {
  const KetuaLanjutan({super.key});

  @override
  State<KetuaLanjutan> createState() => _KetuaLanjutanState();
}

class _KetuaLanjutanState extends State<KetuaLanjutan> {
  String? selectedLabel;

  final List<String> labels = [
    "Terindikasi Stunting",
    "Terindikasi Obesitas",
    "Balita Normal",
  ];

  final List<String> balitaList = [
    "Contoh 1",
    "Contoh 2",
    "Contoh 3",
    "Contoh 4",
    "Contoh 5",
    "Contoh 6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // untuk kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          "Daftar Balita",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown filter
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: DropdownButtonFormField<String>(
                value: selectedLabel,
                hint: const Text("Label"),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                items: labels.map((label) {
                  return DropdownMenuItem<String>(
                    value: label,
                    child: Text(label),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLabel = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // List nama balita
            Expanded(
              child: ListView.separated(
                itemCount: balitaList.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  final nama = balitaList[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nama,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Aksi ketika tombol "Lihat" ditekan
                            Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const KetuaTindak()),
    );
                          print("Lihat $nama");
                        },
                        child: const Text(
                          "Lihat",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
