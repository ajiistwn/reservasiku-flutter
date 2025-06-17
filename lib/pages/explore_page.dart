// Import pustaka UI Material bawaan Flutter
import 'package:flutter/material.dart';

// Import komponen navigasi drawer
import '../app_drawer.dart';

// Import halaman lain (jika ingin navigasi ke home atau detail properti)
import './home_page.dart';
import './detail_page.dart';

/// Halaman Explore untuk menampilkan daftar properti berupa grid
class ExplorePage extends StatelessWidget {
  /// Data dummy properti
  final List<Map<String, dynamic>> properties = [
    {
      'seed': 'villa1', // digunakan untuk picsum.photos
      'name': 'Villa Mewah',
      'priceRange': 'Rp 1.000.000 - Rp 2.000.000',
      'roomsAvailable': 5,
      'address': 'Jl. Puncak Indah No. 1, Bogor',
    },
    {
      'seed': 'kost1',
      'name': 'Kost Harian Nyaman',
      'priceRange': 'Rp 150.000 - Rp 300.000',
      'roomsAvailable': 10,
      'address': 'Jl. Kost Sejahtera No. 5, Jakarta',
    },
    {
      'seed': 'apartemen1',
      'name': 'Apartemen Modern',
      'priceRange': 'Rp 2.500.000 - Rp 4.000.000',
      'roomsAvailable': 3,
      'address': 'Jl. Apartemen Elite No. 10, Surabaya',
    },
    {
      'seed': 'villa2',
      'name': 'Villa Pantai Indah',
      'priceRange': 'Rp 1.500.000 - Rp 3.000.000',
      'roomsAvailable': 4,
      'address': 'Jl. Pantai No. 20, Bali',
    },
    {
      'seed': 'kost2',
      'name': 'Kost Bulanan Murah',
      'priceRange': 'Rp 800.000 - Rp 1.200.000',
      'roomsAvailable': 8,
      'address': 'Jl. Kost Murah No. 15, Bandung',
    },
    {
      'seed': 'apartemen2',
      'name': 'Apartemen City View',
      'priceRange': 'Rp 3.000.000 - Rp 5.000.000',
      'roomsAvailable': 2,
      'address': 'Jl. City View No. 30, Yogyakarta',
    },
    {
      'seed': 'villa3',
      'name': 'Villa Alam Asri',
      'priceRange': 'Rp 2.000.000 - Rp 3.500.000',
      'roomsAvailable': 6,
      'address': 'Jl. Alam Asri No. 25, Malang',
    },
    {
      'seed': 'kost3',
      'name': 'Kost Eksklusif',
      'priceRange': 'Rp 1.000.000 - Rp 1.500.000',
      'roomsAvailable': 7,
      'address': 'Jl. Kost Eksklusif No. 8, Medan',
    },
    {
      'seed': 'apartemen3',
      'name': 'Apartemen Luxury',
      'priceRange': 'Rp 4.000.000 - Rp 6.000.000',
      'roomsAvailable': 1,
      'address': 'Jl. Luxury No. 50, Makassar',
    },
    {
      'seed': 'villa4',
      'name': 'Villa Tropis',
      'priceRange': 'Rp 2.500.000 - Rp 4.500.000',
      'roomsAvailable': 3,
      'address': 'Jl. Tropis No. 12, Lombok',
    },
    {
      'seed': 'kost4',
      'name': 'Kost Harian Strategis',
      'priceRange': 'Rp 200.000 - Rp 400.000',
      'roomsAvailable': 12,
      'address': 'Jl. Kost Strategis No. 7, Semarang',
    },
    {
      'seed': 'apartemen4',
      'name': 'Apartemen Cozy',
      'priceRange': 'Rp 2.000.000 - Rp 3.500.000',
      'roomsAvailable': 5,
      'address': 'Jl. Cozy No. 18, Palembang',
    },
    {
      'seed': 'villa5',
      'name': 'Villa Puncak Sejuk',
      'priceRange': 'Rp 1.800.000 - Rp 3.200.000',
      'roomsAvailable': 4,
      'address': 'Jl. Puncak Sejuk No. 3, Bogor',
    },
    {
      'seed': 'kost5',
      'name': 'Kost Bulanan Nyaman',
      'priceRange': 'Rp 900.000 - Rp 1.300.000',
      'roomsAvailable': 9,
      'address': 'Jl. Kost Nyaman No. 6, Jakarta',
    },
    {
      'seed': 'apartemen5',
      'name': 'Apartemen Elegan',
      'priceRange': 'Rp 3.500.000 - Rp 5.500.000',
      'roomsAvailable': 2,
      'address': 'Jl. Elegan No. 22, Surabaya',
    },
    // ... daftar properti lainnya (kost, apartemen, villa, dll)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar bagian atas halaman
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Explore'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'), // logo kiri atas
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () =>
                  Scaffold.of(context).openEndDrawer(), // buka drawer kanan
            ),
          ),
        ],
      ),

      // Drawer sisi kanan
      endDrawer: AppDrawer(),

      // Body berisi grid properti
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: properties.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1, // tinggi banding lebar
                ),
                itemBuilder: (context, index) {
                  final property = properties[index];
                  final imageUrl =
                      'https://picsum.photos/seed/${property['seed']}/300/200'; // gambar dummy unik

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PropertyDetailPage(), // harus dibuat
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar properti
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.network(
                              imageUrl,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey[600],
                                  ),
                                );
                              },
                            ),
                          ),

                          // Detail info properti
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 18, 8, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Badge jumlah kamar
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[600],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Rooms Available: ${property['roomsAvailable']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                // Nama properti
                                Text(
                                  property['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),

                                // Rentang harga
                                Text(
                                  property['priceRange'],
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 4),

                                // Lokasi properti
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 12, color: Colors.grey[600]),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        property['address'],
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey[700],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
