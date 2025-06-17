// Import library utama Flutter untuk penggunaan widget material design
import 'package:flutter/material.dart';
// Import file AppDrawer untuk digunakan sebagai drawer samping
import '../app_drawer.dart';

// Komponen Stateless untuk halaman detail properti
class PropertyDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List fasilitas umum yang dimiliki oleh properti
    final List<String> facilities = [
      'WiFi Gratis',
      'AC',
      'Kolam Renang',
      'Parkir',
      'Sarapan',
    ];

    // Data dummy kamar dengan nama, harga, gambar, jumlah tersedia, dan fasilitas masing-masing
    final List<Map<String, dynamic>> rooms = [
      {
        'name': 'Kamar Standard',
        'price': 'Rp 250.000',
        'image': 'https://picsum.photos/seed/1/400/200',
        'available': 3,
        'facilities': ['WiFi Gratis', 'AC', 'Parkir'],
      },
      {
        'name': 'Kamar Deluxe',
        'price': 'Rp 400.000',
        'image': 'https://picsum.photos/seed/2/400/200',
        'available': 1,
        'facilities': ['WiFi Gratis', 'AC', 'Kolam Renang', 'Sarapan'],
      },
      {
        'name': 'Kamar Suite',
        'price': 'Rp 650.000',
        'image': 'https://picsum.photos/seed/4/400/200',
        'available': 0,
        'facilities': [
          'WiFi Gratis',
          'AC',
          'Kolam Renang',
          'Parkir',
          'Sarapan'
        ],
      },
    ];

    return Scaffold(
      // AppBar untuk menampilkan judul halaman dan tombol menu
      appBar: AppBar(
        title: Text('Detail Properti'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'), // Logo kiri atas
        ),
        actions: [
          // Tombol untuk membuka drawer dari sisi kanan
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: AppDrawer(), // Drawer sisi kanan (import dari app_drawer.dart)
      body: SingleChildScrollView(
        // Membungkus isi agar bisa di-scroll
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar utama properti
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/800/400?random',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Nama properti
              Text(
                'Villa Mawar Indah',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Deskripsi singkat properti
              Text(
                'Villa Mawar Indah menawarkan pengalaman menginap mewah dengan suasana yang tenang dan pemandangan alam yang menakjubkan.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Alamat properti
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Colors.red), // Ikon lokasi
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Jl. Raya Puncak No. 88, Cisarua, Bogor, Jawa Barat',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Judul Fasilitas
              Text(
                'Fasilitas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Daftar fasilitas utama properti
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: facilities.map((fasilitas) {
                  return Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(fasilitas, style: TextStyle(fontSize: 16)),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // Judul Room (Kamar)
              Text(
                'Room',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Daftar kamar berdasarkan data rooms
              Column(
                children: rooms.map((room) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar kamar
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            room['image'],
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Badge jumlah kamar yang tersedia
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: room['available'] > 0
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Available: ${room['available']} kamar',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Nama kamar
                              Text(
                                room['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Harga per malam
                              Text(
                                '${room['price']} / malam',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Daftar fasilitas kamar
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Fasilitas:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 8,
                                    children: room['facilities']
                                        .map<Widget>((facility) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.blue),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.check,
                                                size: 16, color: Colors.white),
                                            const SizedBox(width: 4),
                                            Text(facility,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                )),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // Tombol "Pilih" untuk memilih kamar
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Aksi saat tombol dipencet
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Pilih',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
