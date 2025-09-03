import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/pemeriksaan.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  String? selectedVitamin;
  final TextEditingController beratController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data Balita"), leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PemeriksaanPage()),
    );
          },
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Hari Ini",
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 12),

            // Kotak info balita
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Adiba Kirana",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("48 Bulan",
                      style: TextStyle(
                          fontSize: 14, fontStyle: FontStyle.italic)),
                  SizedBox(height: 4),
                  Text("Siti Aminah",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              hint: const Text("Pemberian vitamin/Imunisasi"),
              value: selectedVitamin,
              items: ["Vitamin A", "Imunisasi Polio", "Imunisasi Campak"]
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedVitamin = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Input Berat & Tinggi
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: beratController,
                    decoration: InputDecoration(
                      labelText: "Masukkan Berat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: tinggiController,
                    decoration: InputDecoration(
                      labelText: "Masukkan Tinggi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Input Data
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // aksi simpan data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data berhasil diinput")),
                );
              },
              child: const Text(
                "Input Data",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
