import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/ketua_login.dart';
import 'package:posyandu_mawar/ui/kader_login.dart';
import 'package:posyandu_mawar/ui/login.dart';
import 'package:posyandu_mawar/ui/shared_preference.dart';
import 'package:posyandu_mawar/ui/sign_up.dart';
import 'package:posyandu_mawar/ui/signup_kader.dart';
import 'package:posyandu_mawar/ui/signup_ketua.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
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
                 ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SharedPreferencesViewer(),
      ),
    );
  },
  child: const Text("Lihat SharedPreferences"),
),
              Image.asset(
                'aset/p14.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 10),
              const Text(
                'Pilih peranmu',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 30),
     InkWell(
 onTap: () async {
  final prefs = await SharedPreferences.getInstance();
  final bool isSignedUp = prefs.getBool("isSignedUp") ?? false;


  if (isSignedUp) {

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  } else {
   
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }
},
  borderRadius: BorderRadius.circular(12),
  child: Container(
    width: 300,
    height: 100,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
              'aset/p12.png',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Orang Tua',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 188, 55, 99),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    
  ),
  
),

              const SizedBox(height: 16),
 InkWell(
  onTap: () async{
     final prefs = await SharedPreferences.getInstance();
  final bool isSignedUp = prefs.getBool("isSignedUpkader") ?? false;
  

  if (isSignedUp) {

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginKaderPage()),
    );
  } else {
   
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignUpKader()),
    );
  }
  },
  borderRadius: BorderRadius.circular(12),
  child: Container(
    width: 300,
    height: 100,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
              'aset/p11.png',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Kader Posyandu',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 188, 55, 99),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  ),
),
 const SizedBox(height: 16),
InkWell(
  
  onTap: () async{
     final prefs = await SharedPreferences.getInstance();
  final bool isSignedUp = prefs.getBool("isSignedUpketua") ?? false;
  

  if (isSignedUp) {

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginKetuaPage()),
    );
  } else {
   
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignupKetua()),
    );
  }
  },
  borderRadius: BorderRadius.circular(12),
  child: Container(
    width: 300,
    height: 100,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
              'aset/p10.png',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'ketua Posyandu',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 188, 55, 99),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  ),
),


              // 👉 Username Field
      
        

              // 👉 Password Field
            
              
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