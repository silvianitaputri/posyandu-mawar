import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:posyandu_mawar/ui/antrian.dart';
import 'package:posyandu_mawar/ui/pemeriksaan.dart';


class KaderPage extends StatefulWidget {
  const KaderPage({super.key});

  @override
  State<KaderPage> createState() => _KaderPageState();
}

class _KaderPageState extends State<KaderPage> {
  int currentPageIndex = 0;
  showMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color.fromARGB(255, 202, 110, 110),
                        ),
                        child: Stack(
                          alignment: const Alignment(0, 0),
                          // overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: const Color(0xff232f34), width: 10)),
                                child: const Center(
                                  child: ClipOval(
                                      // child: Image.network(
                                      //   "https://i.sstatic.net/S11YG.jpg?s=64&g=1",
                                      //   fit: BoxFit.cover,
                                      //   height: 36,
                                      //   width: 36,
                                      // ),
                                      ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: const Text(
                                      "Filter filter",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 113, 119, 68)),
                                    ),
                                    // leading: Icon(
                                    //   // Icons.inbox,
                                    //   color: Colors.white,
                                    // ),
                                    onTap: () {},
                                  ),
                                  // ListTile(
                                  //   title: Text(
                                  //     "Starred",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   leading: Icon(
                                  //     Icons.star_border,
                                  //     color: Colors.white,
                                  //   ),
                                  //   onTap: () {},
                                  // ),
                                  // ListTile(
                                  //   title: Text(
                                  //     "Sent",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   leading: Icon(
                                  //     Icons.send,
                                  //     color: Colors.white,
                                  //   ),
                                  //   onTap: () {},
                                  // ),
                                  // ListTile(
                                  //   title: Text(
                                  //     "Trash",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   leading: Icon(
                                  //     Icons.delete_outline,
                                  //     color: Colors.white,
                                  //   ),
                                  //   onTap: () {},
                                  // ),
                                  // ListTile(
                                  //   title: Text(
                                  //     "Spam",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   leading: Icon(
                                  //     Icons.error,
                                  //     color: Colors.white,
                                  //   ),
                                  //   onTap: () {},
                                  // ),
                                  // ListTile(
                                  //   title: Text(
                                  //     "Drafts",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   leading: Icon(
                                  //     Icons.mail_outline,
                                  //     color: Colors.white,
                                  //   ),
                                  //   onTap: () {},
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ))),
                // Container(
                //   height: 56,
                //   color: Color(0xff4a6572),
                // )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 38, 70, 105)),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: Theme(data: Theme.of(context).copyWith( navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
          }
          return const TextStyle(
            color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14);
        },
      ),)),
          child: NavigationBar(
            
            backgroundColor: const Color.fromARGB(255, 188, 55, 99),
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: const Color.fromARGB(255, 142, 191, 243),
            selectedIndex: currentPageIndex,
            
            destinations: const <Widget>[
              NavigationDestination(
          
                icon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.my_library_books_rounded,color: Colors.white),
                label: 'Laporan',
              ),
              NavigationDestination(
                 
                icon: Icon(Icons.person_2_outlined,color: Colors.white),
          
                label: 'Profil',
              ),
              
              
            ],
            
          ),
        ),
        body: <Widget>[
          /// Home page
          Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () async {
            //     // Navigator.of(context).push(
            //     //   MaterialPageRoute(
            //     //       builder: (context) => const HistoriMutasi()),
            //     // );
            //     // Add your onPressed code here!
            //   },
            //   // label: const Text('babi'),
            //   backgroundColor: Color.fromARGB(255, 171, 7, 108),
            //   foregroundColor: Colors.white,
            //   // child: const Icon(Icons.add),
            // ),
//            appBar: AppBar(
//   toolbarHeight: 80,
//   title: const Text.rich(
//     TextSpan(
//       children: [
//         TextSpan(
//           text: 'HELLO, Nama Orang !\n',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             height: 1.9,
//           ),
//         ),
//         TextSpan(
//           text: 'Senin 12-12-2023',
//           style: TextStyle(
//             fontWeight: FontWeight.normal,
//             fontSize: 16,
//           ),
//         ),
//       ],
//     ),
//   ),
//   backgroundColor: const Color.fromARGB(255, 142, 191, 243),
//   actions: [
//     PopupMenuButton<String>(
//       icon: const Icon(Icons.more_vert), // ikon tiga titik vertikal
//       onSelected: (value) {
//         if (value == 'logout') {
//           // kode logout di sini
//           print('Logout clicked');
//         } else if (value == 'Help') {
//           // kode buka Help di sini
//           print('Help clicked');
//         }
//       },
//       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         const PopupMenuItem<String>(
//           value: 'logout',
//           child: Text('Logout'),
//         ),
//         const PopupMenuItem<String>(
//           value: 'Help',
//           child: Text('Help'),
//         ),
//       ],
//     ),
//   ],
// ),
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
                'aset/p8.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  Text(
                    'Hallo, ibu Kader!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
               const Column(
                children: [
                  Text(
                    'Semangat melayani hari ini!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
              
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
    InkWell(
  onTap: () {
    print("Orang Tua dipilih");
    // Navigator bisa ditambahkan di sini
        Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PemeriksaanPage()),
    );
  },
  borderRadius: BorderRadius.circular(12),
  child: Container(
    width: 300,
    height: 100,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 188, 55, 99),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'aset/p6.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),

        // Expanded untuk teks kiri
        const Expanded(
          child: Text(
            'Belum Diperiksa',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 243, 243, 243),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // Teks angka di kanan
        const Text(
          '21',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),


              const SizedBox(height: 16),
 InkWell(
  onTap: () {
    print("Orang Tua dipilih");
    // Misalnya langsung navigate ke halaman biodata
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => const LoginKaderPage()),
    // );
  },
  borderRadius: BorderRadius.circular(12),
  child: Container(
    width: 300,
    height: 100,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 188, 55, 99),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
              'aset/p9.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Proses Pemeriksaan',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          
        ),
         const Text(
          '1',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),
 const SizedBox(height: 16),
InkWell(
  
  onTap: () {


    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => const LoginKetuaPage()),
    // );
  },
  borderRadius: BorderRadius.circular(12),
  child: Container(
    width: 300,
    height: 100,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 188, 55, 99),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
              'aset/p7.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Pemeriksaan Selesai',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Text(
          '1',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
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

          ),

          // / Notifications page
           Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () async {
            //     // Navigator.of(context).push(
            //     //   MaterialPageRoute(
            //     //       builder: (context) => const HistoriMutasi()),
            //     // );
            //     // Add your onPressed code here!
            //   },
            //   // label: const Text('babi'),
            //   backgroundColor: Color.fromARGB(255, 171, 7, 108),
            //   foregroundColor: Colors.white,
            //   // child: const Icon(Icons.add),
            // ),
           appBar: AppBar(
  toolbarHeight: 80,
  title: const Center(
  child: Text.rich(
    TextSpan(
      text: 'Laporan Data Balita',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        height: 1.9,
      ),
    ),
    textAlign: TextAlign.center,
  ),
),

  backgroundColor: const Color.fromARGB(255, 142, 191, 243),

),

backgroundColor: const Color.fromARGB(255, 142, 191, 243),
body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    
Container(
  width: double.infinity,
  height: 220,
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 245, 232, 211),
    border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 3),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start, // konten rata kiri
    children: [
      const Text(
        'Hari Ini',
        style: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 8),
      const Text(
        'Laporan Pemeriksaan Balita',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textAlign: TextAlign.start,
      ),
      
      const SizedBox(height: 8),
      const Text(
        'Meliput data antropomentri dan hasil clustering pada balita',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 34),
      Row(
        mainAxisAlignment: MainAxisAlignment.start, // tombol mulai dari kiri
        children: [
          ElevatedButton(
            onPressed: () {
              print('Tombol 1 ditekan');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 188, 55, 99),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            ),
            child: const Text(
              'Olah Data',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16), // jarak antar tombol
          ElevatedButton(
            onPressed: () {
              print('Tombol 2 ditekan');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 188, 55, 99),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            ),
            child: const Text(
              'Cetak xls.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ],
  ),
)
,
const SizedBox(height: 32),


    ],
  ),
),


          ),
             Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () async {
            //     // Navigator.of(context).push(
            //     //   MaterialPageRoute(
            //     //       builder: (context) => const HistoriMutasi()),
            //     // );
            //     // Add your onPressed code here!
            //   },
            //   // label: const Text('babi'),
            //   backgroundColor: Color.fromARGB(255, 171, 7, 108),
            //   foregroundColor: Colors.white,
            //   // child: const Icon(Icons.add),
            // ),
           appBar: AppBar(
  toolbarHeight: 80,
  title: const Center(
  child: Text.rich(
    TextSpan(
      text: 'Profil',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        height: 1.9,
      ),
    ),
    textAlign: TextAlign.center,
  ),
),

  backgroundColor: const Color.fromARGB(255, 142, 191, 243),

),

body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
     // Profil Ibu
Icon(
  CupertinoIcons.person_circle_fill,
  size: 100, // kira-kira setara CircleAvatar radius 50 (diameter 100)
  color:const Color(0xFFBC3763),
),
Center(
  child: Text(
    'Partuni',
    style: TextStyle (fontSize: 14,  fontWeight: FontWeight.bold,),
    
    
  ),),
const SizedBox(height: 12),
Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.blueGrey, width: 2),
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Column(
    
    crossAxisAlignment: CrossAxisAlignment.start,
    
    children: [
   
      Row(
        children: [
          Text('No SK Kader       : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('Pos/2003/PRT', style: TextStyle(fontSize: 16)),
        ],
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Text('jabatan                : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('Bendahara', style: TextStyle(fontSize: 16)),
        ],
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Text('Nomor HP           : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('0895345175237', style: TextStyle(fontSize: 16)),
        ],
      ),
    ],
  ),
),

const SizedBox(height: 32),
 Container(
  width: double.infinity,
  alignment: Alignment.topLeft, // pastikan konten rata kiri
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // child di kiri
    children: [
      ElevatedButton(
        onPressed: () {
          print('Tombol 1 ditekan');
        },
        style: ElevatedButton.styleFrom(
       
          foregroundColor: const Color.fromARGB(255, 18, 3, 3),
          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(10),  side: const BorderSide(
        color: Colors.black, 
        width: 1,           
      ),
            
          ),
          padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
        ),
        child: const Text(
          'Keluar Akun ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ],
  ),
)

// Profil Anak


    ],
  ),
),



          ),

        ][currentPageIndex],
      ),
    );
  }
}
Widget beritaCard(String title, String description) {
  return Container(
    width: 200,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
      border: Border.all(color: Colors.blue, width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}