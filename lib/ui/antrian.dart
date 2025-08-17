import 'package:flutter/material.dart';
import 'package:posyandu_mawar/ui/posyandu_page.dart';

class Antrian extends StatefulWidget {
  const Antrian({super.key});

  @override
  State<Antrian> createState() => _AntrianState();
}

class _AntrianState extends State<Antrian> {
    final List<String> photos = [
    'aset/p1.jpg',
    'aset/p2.jpg',
    'aset/p3.jpg',
    'aset/p4.jpg',
    'aset/p5.jpg',
  ];
    int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Foto + back button
         Stack(
  children: [
    SizedBox(
      width: double.infinity,
      height: 180,
      child: PageView.builder(
        itemCount: photos.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            photos[index],
            fit: BoxFit.cover,
          );
        },
      ),
    ),
    Positioned(
      top: 8,
      left: 8,
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.5),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
           onPressed: ()async { Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const PosyanduPage(),
                        ),
                      );},
        ),
      ),
    ),
    Positioned(
      bottom: 8,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(photos.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: currentIndex == index ? 12 : 8,
            height: currentIndex == index ? 12 : 8,
            decoration: BoxDecoration(
              color: currentIndex == index ? Colors.white : Colors.white54,
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    ),
  ],
),


            // Judul dan rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Posyandu Mawar 15 Katapang',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            // Alamat dengan icon lokasi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(Icons.location_on_outlined, color: Colors.grey),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Kp. Sindangsari Rt 02 Rw/ 15 Des/kec. Katapang Bandung, Jawabarat.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

      
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        _buildMenuIcon(Icons.calendar_today_outlined, 'Cek Jadwal'),
        const SizedBox(width: 16), // spasi antar icon
        _buildMenuIcon(Icons.vaccines_outlined, 'Imunisasi'),
        const SizedBox(width: 16),
        _buildMenuIcon(Icons.local_hospital_outlined, 'CATIN'),
        const SizedBox(width: 16),
        _buildMenuIcon(Icons.medical_services_outlined, 'Cek Kesehatan'),
        const SizedBox(width: 16),
        _buildMenuIcon(Icons.face_retouching_natural_outlined, 'Edukasi'),
        const SizedBox(width: 16),
        _buildMenuIcon(Icons.room_service_outlined, 'PMT'),
        const SizedBox(width: 16),
        _buildMenuIcon(Icons.medication_liquid_outlined, 'keluarga Berencana (KB)'),
      ],
    ),
  ),
),


            const SizedBox(height: 20),

            // Jadwal Praktek tanggal-tanggal
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Jadwal Praktek', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: _buildBoxItem('04', 'Hari'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildBoxItem('JULI', 'Bulan'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildBoxItem('2025', 'Tahun'),
          ),
        ],
      ),
    ],
  ),
),


            const SizedBox(height: 20),

            // Kuota tersisa dan button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '0 pengunjung \nsudah siap menunggu giliran',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
               ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.pinkAccent,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
   return AlertDialog(
  titlePadding: EdgeInsets.zero, // Hilangkan padding default
  title: Container(
    padding: const EdgeInsets.all(16),
    color: Colors.blue, // Warna background di belakang title
    child: const Text(
      'Konfirmasi',
      style: TextStyle(
        color: Colors.white, // Warna teks
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text('Jadwal Praktek:', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 4),
      Text('Selasa, 04 Juli 2025'),
    ],
  ),
  actions: [
    TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Batal'),
    ),
   ElevatedButton(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.pinkAccent,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
       onPressed: ()async { Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const PosyanduPage(),
                        ),
                      );},
      child: const Text('Ya',style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    ),)
    ),
  ],
);


      },
    );
  },
  child: const Text(
    'Ambil Antrian',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ),
)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.grey[700]),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildDateItem(String day, String month, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: selected ? Colors.pinkAccent : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: selected ? const Color.fromARGB(255, 101, 70, 70) : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            month,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
Widget _buildBoxItem(String title, String subtitle) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    ),
  );
}
