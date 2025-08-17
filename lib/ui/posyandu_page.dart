import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:posyandu_mawar/ui/antrian.dart';


class PosyanduPage extends StatefulWidget {
  const PosyanduPage({super.key});

  @override
  State<PosyanduPage> createState() => _PosyanduPageState();
}

class _PosyanduPageState extends State<PosyanduPage> {
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
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 109, 109, 96)),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: const Color.fromARGB(255, 142, 191, 243),
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.filter_frames_outlined),
              label: 'Riwayat',
            ),
            NavigationDestination(
       
              icon: Icon(Icons.person_2_outlined),
              label: 'Profil',
            ),
          ],
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
           appBar: AppBar(
  toolbarHeight: 80,
  title: const Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: 'HELLO, Nama Orang !\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            height: 1.9,
          ),
        ),
        TextSpan(
          text: 'Senin 12-12-2023',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
  backgroundColor: const Color.fromARGB(255, 142, 191, 243),
  actions: [
    PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert), // ikon tiga titik vertikal
      onSelected: (value) {
        if (value == 'logout') {
          // kode logout di sini
          print('Logout clicked');
        } else if (value == 'Help') {
          // kode buka Help di sini
          print('Help clicked');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Logout'),
        ),
        const PopupMenuItem<String>(
          value: 'Help',
          child: Text('Help'),
        ),
      ],
    ),
  ],
),

body: Column(
  children: [
    Container(
      width: double.infinity,
      height: 200, // tinggi kotak grafik
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 2),
                FlSpot(3, 5),
                FlSpot(4, 3),
                FlSpot(5, 4),
                FlSpot(6, 7),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              dotData: const FlDotData(show: true),
            ),
          ],
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
          ),
          gridData: const FlGridData(show: true),
          borderData: FlBorderData(show: true),
        ),
      ),
    ),

    Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
       onPressed: ()async { Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Antrian(),
                        ),
                      );},
        child: const Text(
          'Ambil Antrian',
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),

    const SizedBox(height: 16), // jarak ke berita

    SizedBox(
      height: 250, // tinggi kontainer berita
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            beritaCard("Berita 1", "Ini adalah berita pertama."),
            beritaCard("Berita 2", "Berita kedua dengan isi menarik."),
            beritaCard("Berita 3", "Update terbaru di berita ketiga."),
            beritaCard("Berita 4", "Berita keempat sangat penting."),
            beritaCard("Berita 5", "Berita kelima penuh informasi."),
          ],
        ),
      ),
    ),
  ],
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
      text: 'Riwayat Kesehatan Balita',
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     const Center(
  child: Text(
    'Hari Ini',
    style: TextStyle(fontSize: 14),
  ),
),

      const Text(
        'Tinggi Badan: 150 cm',
        style: TextStyle(fontSize: 18,),
      ),
      const SizedBox(height: 8),
      const Text(
        'Berat Badan: 45 kg',
        style: TextStyle(fontSize: 18,),
      ),
      const SizedBox(height: 8),
      const Text(
        'Imunisasi: BCG/Polio',
        style: TextStyle(fontSize: 18,),
      ),

      const SizedBox(height: 24),
 Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green, // Ganti ke Colors.red untuk stunting/gemuk
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'Status: Normal',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Kotak status hasil
     Container(
  width: double.infinity,
  height: 200, // tinggi kotak
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: const Color.fromARGB(255, 87, 157, 92), width: 2),
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Text(
          'Teridentifikasi:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 87, 157, 92),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8), // jarak antar teks
        Text(
          'Normal',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 87, 157, 92),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
),

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
    'Profil Ibu',
    style: TextStyle(fontSize: 14),
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
          Text('Nama Ibu            : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('Siti Aminah', style: TextStyle(fontSize: 16)),
        ],
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Text('NIK                      : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('32680965320001', style: TextStyle(fontSize: 16)),
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

// Profil Anak
 Icon(
  CupertinoIcons.person_circle_fill,
  size: 100, // kira-kira setara CircleAvatar radius 50 (diameter 100)
  color: const Color(0xFFBC3763),
),
Center(
  child: Text(
    'Profil Anak',
    style: TextStyle(fontSize: 14),
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
          Text('Nama                : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('Ahmad', style: TextStyle(fontSize: 16)),
        ],
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Text('Usia                  : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('2 Tahun  (24 Bulan)', style: TextStyle(fontSize: 16)),
        ],
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Text('Status               : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 8),
          Text('Normal', style: TextStyle(fontSize: 16)),
        ],
      ),
    ],
  ),
),

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