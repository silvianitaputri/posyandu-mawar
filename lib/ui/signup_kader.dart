import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/kader_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:posyandu_mawar/ui/login.dart';

class SignUpKader extends StatefulWidget {
  const SignUpKader({super.key});

  @override
  State<SignUpKader> createState() => _SignUpKaderState();
}

class _SignUpKaderState extends State<SignUpKader> {
  // 🔹 Controllers
  final _namalengkapController = TextEditingController();
  final _alamatemailController = TextEditingController();
  final _nomorSkkaderController = TextEditingController();
  final _jabatankaderController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // 🔹 Simpan ke SharedPreferences
  Future<void> _saveSignUpKader() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Kata sandi tidak sama!")),
        );
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("Namakader", _namalengkapController.text);
      await prefs.setString("emailkader", _alamatemailController.text);
      await prefs.setString("skkader", _nomorSkkaderController.text);
       await prefs.setString("Jabatankader", _jabatankaderController.text);
      await prefs.setString("passwordkader", _passwordController.text);
        await prefs.setBool("isSignedUpkader", true);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pendaftaran berhasil disimpan")),
      );

      // pindah ke login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginKaderPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 191, 243),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Form(
                key: _formKey,
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

                    // 🔹 NIK
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        
                        controller: _namalengkapController,
                          style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                       
                        validator: (v) =>
                            v == null || v.isEmpty ? "Nama wajib diisi" : null,
                        decoration: const InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                          labelText: 'Masukan Nama Lengkap',
                          hintText: 'Masukkan Nama Sesuai KTP',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                           labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                          icon: Icon(CupertinoIcons.person,
                              color: Color.fromARGB(255, 15, 14, 14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🔹 Nama
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _alamatemailController,
                          style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                        validator: (v) =>
                            v == null || v.isEmpty ? "Email wajib isi" : null,
                        decoration: const InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                    hintText: 'email cth: tiaraandini@gmail.com',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                     labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                          labelText: 'Masukan Email Aktif',
                          icon: Icon(CupertinoIcons.person_add,
                              color: Color.fromARGB(255, 15, 14, 14)),
                        ),
                      ),
                    ),
                             const SizedBox(height: 16),
                    // Jabatan
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _jabatankaderController,
                          style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                        validator: (v) =>
                            v == null || v.isEmpty ? "Jabatan Wajib Isi" : null,
                        decoration: const InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                    hintText: 'cth : Anggota',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                     labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                          labelText: 'Masukan Jabatan Diposyandu',
                          icon: Icon(CupertinoIcons.person_add,
                              color: Color.fromARGB(255, 15, 14, 14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🔹 Nomor Telepon
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _nomorSkkaderController,
                      
                          style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                        validator: (v) => v == null || v.isEmpty
                            ? "No SK Kader wajib isi"
                            : null,
                        decoration: const InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                          labelText: 'Masukan No. SK',
                           hintText: 'Masukkan Nomor SK Kader',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                           labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                          icon: Icon(Icons.call,
                              color: Color.fromARGB(255, 15, 14, 14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🔹 Password
                    Padding(
                       
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: const TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                        controller: _passwordController,
                        obscureText: true,
                        validator: (v) => v == null || v.isEmpty
                            ? "Kata sandi wajib diisi"
                            : null,
                        decoration: const InputDecoration( hintText: 'Contoh:Putri21!',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                            enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                          labelText: 'Masukan Kata Sandi Baru',
                           labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                          icon: Icon(Icons.lock_outline_rounded,
                              color: Color.fromARGB(255, 15, 14, 14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🔹 Konfirmasi Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                         style: const TextStyle(color:  const Color.fromARGB(255, 15, 14, 14)),
                        controller: _confirmPasswordController,
                        obscureText: true,
                        validator: (v) => v == null || v.isEmpty
                            ? "Konfirmasi kata sandi wajib diisi"
                            : null,
                        decoration: const InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 15, 14, 14)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14), width: 2),
                    ),
                          labelText: 'Ulangi Kata Sandi',
                        labelStyle: const TextStyle(color:Color.fromARGB(255, 15, 14, 14)),
                    hintText: 'Contoh:Putri21!',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 15, 14, 14)),
                     
                          icon: Icon(Icons.lock_outline_rounded,
                              color: Color.fromARGB(255, 15, 14, 14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // 🔹 Tombol Daftar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                        onPressed: _saveSignUpKader,
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
                        child: const Text(
                          'Daftar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
