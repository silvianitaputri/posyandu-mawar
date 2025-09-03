import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/ketua_lanjutan.dart';
import 'package:posyandu_mawar/ui/ketua_page.dart';

// This is the main UI screen for the stunting indication.
// It displays a message and an action button for follow-up.
class KetuaTindak extends StatefulWidget {
  const KetuaTindak({super.key});

  @override
  State<KetuaTindak> createState() => _KetuaTindakState();
}

class _KetuaTindakState extends State<KetuaTindak> {
  // Controller to manage the text input for the description field.
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the widget tree.
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
             Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const KetuaLanjutan()),
    );
          },
        ),
        title: const Text(
          "Nama Balita : Sekar",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 102, 187, 255), 
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 220, 53, 69), 
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    minimumSize: const Size(double.infinity, 50), // Make it wide
                  ),
                  child: const Text(
                    'Ter Indikasi Stunting',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Container for the description input field
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 173, 216, 230), // Light blue color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: null, // Allows for multiple lines of text
                    style: const TextStyle(color: Colors.black87),
                    decoration: const InputDecoration(
                      border: InputBorder.none, // Removes the default underline border
                      hintText: 'Masukkan deskripsi di sini...',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Dark blue "Tindak Lanjut" button
                ElevatedButton(
                  onPressed: () {
           showDialog(
      context: context,
      builder: (BuildContext context) {
   return AlertDialog(
  titlePadding: EdgeInsets.zero,
  title: Container(
    padding: const EdgeInsets.all(16),
    color: Colors.pinkAccent, 
    child: const Text(
      'Konfirmasi',
      style: TextStyle(
        color: Colors.white, 
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  content: const Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Apakah Anda yakin ingin mengirim tindak lanjut?', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 4),
      Text('Pesan akan terkirim ke orang tua dan kader terkai'),
    ],
  ),
  actions: [
    TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Batal'),
    ),
   ElevatedButton(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.pinkAccent,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
       onPressed: ()async { Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const KetuaPage(),
                        ),
                      );},
      child: const Text('Ya',style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    ),)
    ),
  ],
);


      },
    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 47, 86, 150), // Dark blue color
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  child: const Text(
                    'Tindak Lanjut',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
