import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_mawar/ui/posyandu_page.dart'; // ✅ Wajib untuk DateFormat

class BiodataAnak extends StatefulWidget {
  const BiodataAnak({super.key});

  @override
  State<BiodataAnak> createState() => _BiodataAnakState();
}

class _BiodataAnakState extends State<BiodataAnak> {
  final TextEditingController _date = TextEditingController();

  @override
  void dispose() {
    _date.dispose();
    super.dispose();
  }
    List<String> gender = <String>[
    '0',
    '1',
  ];
   String dropdownValue = '0';
   void _handleDropdownChanged(String? value) {
    setState(() {
      dropdownValue = value!;
      // print(dropdownValue);var checkpenjualan = _handleDropdownChanged(dropdownValue);
      print(((dropdownValue)));
      // return dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 188, 55, 99),
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

                    // 👉 Username Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
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
                      child:TextFormField(
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
      firstDate: DateTime(2020),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      setState(() {
        _date.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  },
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    labelText: 'Tanggal',
    labelStyle: const TextStyle(color: Colors.white),
    hintText: 'Pilih Tanggal',
    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
    icon: const Icon(Icons.calendar_today, color: Colors.white),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white), // garis bawah putih
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
  ),
),

                    ),
                      const SizedBox(height: 30),

                    // 👉 Username Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButtonFormField<String>(
                                // labelText: Text("Pilih Metode Pembayaran"),
                                decoration: const InputDecoration(
                                   labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Pilih Jenis Kelamin',
                                  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white), // garis bawah putih
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
                                    icon: Icon(Icons.category,color: Colors.white),
                                    border: UnderlineInputBorder()),
                                value: dropdownValue,
                                // icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                // underline: Container(
                                //   height: 2,
                                //   color: Colors.deepPurpleAccent,
                                // ),
                                dropdownColor: Colors.pink[700],

                                onChanged: _handleDropdownChanged,
                                items: gender.map<DropdownMenuItem<String>>(
                                    (String value) {
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
        mainAxisAlignment: MainAxisAlignment.end, // kanan bawah
        children: [
          ElevatedButton(
             onPressed: ()async { Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const PosyanduPage(),
                        ),
                      );},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFBC3763),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
