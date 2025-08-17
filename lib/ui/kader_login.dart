import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/biodata_anak.dart';
import 'package:posyandu_mawar/ui/kader_page.dart';

class LoginKaderPage extends StatefulWidget {
  const LoginKaderPage({super.key});

  @override
  State<LoginKaderPage> createState() => _LoginKaderPageState();
}

class _LoginKaderPageState extends State<LoginKaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 191, 243),
    body: SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height, // minimal setinggi layar
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'aset/logo mawar.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 20),
              const Text(
                'Login',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
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
                    labelText: 'Nomor identitas',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintText: 'Masukkan Nomor SK',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3)),
                    icon: const Icon(CupertinoIcons.person_add, color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintText: 'Masukkan Nama Lengkap',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3)),
                    icon: const Icon(CupertinoIcons.person, color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 👉 Password Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintText: 'Masukkan Kata Sandi',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3)),
                    icon: const Icon(CupertinoIcons.lock, color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                   onPressed: ()async { Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const KaderPage(),
                        ),
                      );},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,           
    foregroundColor: const Color(0xFFBC3763), 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), 
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 15,
    ),
  ),
                  child: const Text('Masuk',style: TextStyle(fontWeight: FontWeight.bold),),
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