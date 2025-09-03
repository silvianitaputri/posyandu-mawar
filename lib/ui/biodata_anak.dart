import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ✅ import
import 'package:posyandu_mawar/ui/posyandu_page.dart';

class BiodataAnak extends StatefulWidget {
  const BiodataAnak({super.key});

  @override
  State<BiodataAnak> createState() => _BiodataAnakState();
}

class _BiodataAnakState extends State<BiodataAnak> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _namaAnakController = TextEditingController(); // ✅ controller baru

  List<String> gender = <String>['0', '1'];
  String dropdownValue = '0';

  @override
  void dispose() {
    _date.dispose();
    _namaAnakController.dispose();
    super.dispose();
  }

  void _handleDropdownChanged(String? value) {
    setState(() {
      dropdownValue = value!;
      print(dropdownValue);
    });
  }

  // ✅ Fungsi Simpan ke SharedPreferences
  Future<void> _saveBiodata() async {
    if (_namaAnakController.text.isEmpty || _date.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lengkapi semua data terlebih dahulu!")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("namaAnak", _namaAnakController.text);
    await prefs.setString("tanggalLahirAnak", _date.text);
    await prefs.setString("jenisKelaminAnak", dropdownValue);
     await prefs.setBool("isiDataAnak", true);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Biodata Anak berhasil disimpan")),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PosyanduPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 55, 99),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.person_circle_fill,
                      size: MediaQuery.of(context).size.width * 0.6,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Isi Data Anak',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 👉 Nama Anak
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _namaAnakController, // ✅ pakai controller
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Nama Anak',
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: 'Masukkan Nama Sesuai KIA',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.3)),
                          icon: const Icon(CupertinoIcons.person,
                              color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 👉 Date Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _date,
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tanggal Belum Diisi';
                          }
                          return null;
                        },
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2026),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              _date.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            });
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Tanggal',
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: 'Pilih Tanggal',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.3)),
                          icon: const Icon(Icons.calendar_today,
                              color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 👉 Jenis Kelamin
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Pilih Jenis Kelamin',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                          icon: Icon(Icons.category, color: Colors.white),
                        ),
                        value: dropdownValue,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.pink[700],
                        onChanged: _handleDropdownChanged,
                        items: gender.map<DropdownMenuItem<String>>((String value) {
                          var name = value;
                          if (value == '0') {
                            name = "Perempuan";
                          }
                          if (value == '1') {
                            name = 'Laki-Laki';
                          }
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(name),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // 👉 Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: _saveBiodata, // ✅ panggil fungsi simpan
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFFBC3763),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text(
                              'Simpan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
