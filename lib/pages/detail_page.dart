import 'package:flutter/material.dart';
import '../app_drawer.dart';

class PropertyDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> facilities = [
      'WiFi Gratis',
      'AC',
      'Kolam Renang',
      'Parkir',
      'Sarapan',
    ];

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
      appBar: AppBar(
        title: Text('Detail Properti'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Properti dari Picsum
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

              // Nama Properti
              Text(
                'Villa Mawar Indah',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Deskripsi
              Text(
                'Villa Mawar Indah menawarkan pengalaman menginap mewah dengan suasana yang tenang dan pemandangan alam yang menakjubkan.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Alamat
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Colors.red),
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

              // Fasilitas
              Text(
                'Fasilitas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
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

              // List Room
              Text(
                'Room',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
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
                              // Badge "Available Room"
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
                              // Nama Kamar
                              Text(
                                room['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Harga
                              Text(
                                '${room['price']} / malam',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 10),
                              // List Fasilitas
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
                                    spacing: 12, // Jarak horizontal antar item
                                    runSpacing:
                                        8, // Jarak vertikal antar baris jika pindah
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
                              // Tombol Pilih
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Aksi ketika tombol "Pilih" ditekan
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // Warna background tombol
                                    side: const BorderSide(
                                      color: Colors.black, // Warna border
                                      width: 0.5, // Ketebalan border
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Opsional, untuk sudut tombol
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
