import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromARGB(255, 15, 14, 14),
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
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                  decoration: InputDecoration(
                    labelText: 'Masukan NIK',
                    labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                    hintText: 'Masukkan Nomor Induk Kependudukan',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14).withOpacity(0.3)),
                    icon: const Icon(CupertinoIcons.person, color:Color.fromARGB(255, 15, 14, 14)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 👉 Password Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                  decoration: InputDecoration(
                    labelText: 'Masukan Nama',
                    labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                    hintText: 'Nama Lengkap Sesuai KTP',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14).withOpacity(0.3).withOpacity(0.3)),
                    icon: const Icon(CupertinoIcons.person_add, color: Color.fromARGB(255, 15, 14, 14)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 👉 Username Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                   keyboardType: TextInputType.number,
                  style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                  decoration: InputDecoration(
                    labelText: 'Masukan Nomor Telepon',
                    labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                    hintText: 'Masukkan Nomor telepon yang Aktif',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14).withOpacity(0.3)),
                    icon: const Icon(Icons.call, color:Color.fromARGB(255, 15, 14, 14)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                  ),
                ),
              ),
              
               const SizedBox(height: 30),

              // 👉 Username Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
              
                  style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                  decoration: InputDecoration(
                    labelText: 'Masukan Kata Sandi Baru',
                    labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                    hintText: 'Contoh:Putri21!',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14).withOpacity(0.3)),
                    icon: const Icon(Icons.lock_outline_rounded, color:Color.fromARGB(255, 15, 14, 14)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 👉 Username Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
              
                  style: const TextStyle(color:  const Color.fromARGB(255, 15, 14, 14)),
                  decoration: InputDecoration(
                    labelText: 'Ulangi Kata Sandi',
                    labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                    hintText: 'Contoh:Putri21!',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14).withOpacity(0.3)),
                    icon: const Icon(Icons.lock_outline_rounded, color:Color.fromARGB(255, 15, 14, 14)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
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
                          builder: (context) => const LoginPage(),
                        ),
                      );},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,           
    foregroundColor: const Color.fromARGB(255, 0, 0, 0), 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), 
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 15,
    ),
  ),
                  child: const Text('Daftar',style: TextStyle(fontWeight: FontWeight.bold),),
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