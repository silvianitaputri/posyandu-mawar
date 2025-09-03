import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/biodata_anak.dart';
import 'package:posyandu_mawar/ui/posyandu_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

Future<void> _login() async {
  final prefs = await SharedPreferences.getInstance();

  final savedNama = prefs.getString("namaIbu");    
  final savedPassword = prefs.getString("passwordIbu");

  if (_formKey.currentState!.validate()) {
    if (_usernameController.text == savedNama &&
        _passwordController.text == savedPassword) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login berhasil ✅")),
      );

      // Simpan status login
      await prefs.setBool("isLoggedIn", true);

      // Cek apakah biodata anak sudah diisi
      final bool biodataAnak = prefs.getBool("isiDataAnak") ?? false;

      if (biodataAnak) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PosyanduPage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BiodataAnak()),
        );
      }

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau Kata Sandi salah ❌")),
      );
    }
  }
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
                key: _formKey,
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
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 🔹 Username
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(color: Colors.white),
                        validator: (v) =>
                            v == null || v.isEmpty ? "Username wajib diisi" : null,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: 'Masukkan Nama Sesuai KTP',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                          icon: const Icon(CupertinoIcons.person, color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🔹 Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        validator: (v) =>
                            v == null || v.isEmpty ? "Kata sandi wajib diisi" : null,
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: 'Masukkan Kata Sandi',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                          icon: const Icon(CupertinoIcons.lock, color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // 🔹 Tombol Login
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                        onPressed: _login,
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
                        child: const Text(
                          'Masuk',
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
