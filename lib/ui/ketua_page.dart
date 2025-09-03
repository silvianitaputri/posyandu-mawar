import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/ketua_lanjutan.dart';
import 'package:shared_preferences/shared_preferences.dart';


class KetuaPage extends StatefulWidget {
  const KetuaPage({super.key});

  @override
  State<KetuaPage> createState() => _KetuaPageState();
}

    final List<Map<String, dynamic>> data = [
      {
        "title": "Today – 23 April 2024",
        "jumlah": 4,
        "isToday": true,
      },
      {
        "title": "Bulan Lalu – 23 Maret 2024",
        "jumlah": 2,
        "isToday": false,
      },
      {
        "title": "2 Bulan Lalu – 23 Februari 2024",
        "jumlah": 3,
        "isToday": false,
      },
      {
        "title": "3 Bulan Lalu – 23 Januari 2024",
        "jumlah": 3,
        "isToday": false,
      },
      {
        "title": "23 Desember 2023",
        "jumlah": 2,
        "isToday": false,
      },
    ];
class _KetuaPageState extends State<KetuaPage> {
  String namalengkap = "";
  String emailposyandu = "";
  String jabatanketua = "";
 



  @override
  void initState() {
    super.initState();
    _loadData(); // 🔹
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
  
      namalengkap = prefs.getString("Namalengkap") ?? "Belum diisi";
      emailposyandu = prefs.getString("EmailPosyandu") ?? "-";
      jabatanketua = prefs.getString("Jabatanketua") ?? "-";


      
   } );}
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
      backgroundColor: const Color(0xFF2196F3), // biru background luar
      body: Column(
        children: [
          // Header biru atas
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            color: const Color(0xFF2196F3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // teks kiri
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hallo, Kader!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Ayo cek segera cek pengunjung",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // bulat putih kanan
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),

          // Container isi
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF0D47A1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 3,
                          offset: const Offset(1, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 20, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${item['jumlah']} Balita Berisiko",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: item["isToday"]    ? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KetuaLanjutan(), // ganti dengan page yg mau dituju
            ),
          );
        }
      : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: item["isToday"]
                                ? Colors.pink
                                : Colors.grey.shade200,
                            foregroundColor: item["isToday"]
                                ? Colors.white
                                : Colors.black54,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Lihat"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
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
  height: 250,
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
    '$namalengkap',
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
  child: Column(
    
    crossAxisAlignment: CrossAxisAlignment.start,
    
    children: [
   
 

      Row(
        children: [
          const Text('jabatan                : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 8),
          Text('$jabatanketua', style: const TextStyle(fontSize: 16)),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          const Text('Email    : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 8),
          Text('$emailposyandu', style: const TextStyle(fontSize: 16)),
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