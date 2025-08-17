import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/input_data.dart';
import 'package:posyandu_mawar/ui/kader_page.dart';

class PemeriksaanPage extends StatefulWidget {
  const PemeriksaanPage({super.key});

  @override
  State<PemeriksaanPage> createState() => _PemeriksaanPageState();
}

class _PemeriksaanPageState extends State<PemeriksaanPage> {
  // Contoh data dummy
  final List<Map<String, dynamic>> dataPasien = [
    {"nama": "Andi farhan", "umur": 25, "status": "Belum diperiksa"},
    {"nama": "Budi utama", "umur": 30, "status": "Sudah diperiksa"},
    {"nama": "Citra", "umur": 22, "status": "Belum diperiksa"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
        title: const Text("Daftar Pemeriksaan"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const KaderPage()),
    );
          },
        ),
      ),
      body: LayoutBuilder(
  builder: (context, constraints) {
    return SizedBox(
      width: constraints.maxWidth, // tabel selebar layar
      child: DataTable(
        columnSpacing: 20,
        columns: const [
          DataColumn(label: Text("Nama")),
          DataColumn(label: Text("Umur")),
          DataColumn(label: Text("Aksi")),
        ],
        rows: dataPasien.map((pasien) {
          return DataRow(cells: [
            DataCell(Text(pasien["nama"])),
            DataCell(Text(pasien["umur"].toString())),
            DataCell(
              TextButton(
                onPressed: () {
                 
                    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const InputData()),
    );
                },
                child: const Text("Periksa"),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  },
),

    );
  }
}
