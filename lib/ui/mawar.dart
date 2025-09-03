import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/role.dart';

class MawarPage extends StatefulWidget {
  const MawarPage({super.key});

  @override
  State<MawarPage> createState() => _MawarPageState();
}

class _MawarPageState extends State<MawarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: Color.fromARGB(255, 188, 55, 99),
      body: Padding(
  padding: const EdgeInsets.all(16),
  child: Stack(
    children: [
      Align(
        child: Image.asset(
          'aset/logo mawar.png',
          fit: BoxFit.contain,
        ),
      ),
      const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 300),
          Center(child: Text(
            'Selamat Datang, Bunda!',
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),)
          
        ],
      ),
       const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 400),
          Center(child: Text(
            'Yuk, pantau tumbuh kembang',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100),
          ),
          ),
          
          
        ],
      ),
       const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 450),
          Center(child: Text(
            'si kecil bersama kami',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100),
          ),
          ),
          
          
        ],
      ),
      const Align(
        alignment: Alignment.bottomCenter,
        child: CircularProgressIndicator(),
      ),
    ],
  ),
),

    );
  }

  void onInit() async {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RolePage())),
    );
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }
}
