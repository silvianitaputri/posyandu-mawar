import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/ketua_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginKetuaPage extends StatefulWidget {
  const LoginKetuaPage({super.key});

  @override
  State<LoginKetuaPage> createState() => _LoginKetuaPageState();
}

class _LoginKetuaPageState extends State<LoginKetuaPage> {
  final _emailposyanduController = TextEditingController();
  final _katasandiketuaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



Future<void> _login() async {
  final prefs = await SharedPreferences.getInstance();

  final savedemailposyandu = prefs.getString("EmailPosyandu");    
   final savedkatsandiketua = prefs.getString("passwordketua");

  if (_formKey.currentState!.validate()) {
    if (_emailposyanduController.text == savedemailposyandu &&
        _katasandiketuaController.text == savedkatsandiketua)  {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login berhasil ✅")),
      );


      await prefs.setBool("isLoggedInkader", true);

  
   

       Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const KetuaPage()),
        );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama dan kata sandi yang dimasukan tidak sesuai❌")),
      );
    }
  }
}
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
                  controller:_emailposyanduController ,
                   validator: (v) =>
                            v == null || v.isEmpty ? "email wajib diisi" : null,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Masukan Email',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintText: 'cth : Lindasari@gmail.com',
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

              const SizedBox(height: 16),

              // 👉 Password Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _katasandiketuaController,
                   validator: (v) =>
                            v == null || v.isEmpty ? "Kata sandi wajib diisi" : null,
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