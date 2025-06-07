import 'package:flutter/material.dart';
import '../app_drawer.dart';
import './home_page.dart'; // kalau butuh kembali ke home
import './detail_page.dart'; // kamu harus buat halaman ini

class ExplorePage extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [
    {
      'seed': 'villa1',
      'name': 'Villa Mewah',
      'priceRange': 'Rp 1.000.000 - Rp 2.000.000',
      'roomsAvailable': 5,
      'address': 'Jl. Puncak Indah No. 1, Bogor',
    },
    {
      'seed': 'kost2',
      'name': 'Kost Eksklusif',
      'priceRange': 'Rp 500.000 - Rp 700.000',
      'roomsAvailable': 3,
      'address': 'Jl. Melati No. 23, Jakarta',
    },
    {
      'seed': 'apartment3',
      'name': 'Apartemen Modern',
      'priceRange': 'Rp 1.500.000 - Rp 3.000.000',
      'roomsAvailable': 2,
      'address': 'Jl. Sudirman No. 45, Jakarta',
    },
    {
      'seed': 'villa4',
      'name': 'Villa Tropis',
      'priceRange': 'Rp 2.500.000 - Rp 4.000.000',
      'roomsAvailable': 4,
      'address': 'Jl. Pantai Selatan No. 10, Bali',
    },
    {
      'seed': 'kost5',
      'name': 'Kost Nyaman',
      'priceRange': 'Rp 400.000 - Rp 600.000',
      'roomsAvailable': 6,
      'address': 'Jl. Kebon Jeruk No. 12, Jakarta',
    },
    {
      'seed': 'apartment6',
      'name': 'Apartemen Mewah',
      'priceRange': 'Rp 2.000.000 - Rp 3.500.000',
      'roomsAvailable': 1,
      'address': 'Jl. Thamrin No. 30, Jakarta',
    },
    {
      'seed': 'villa7',
      'name': 'Villa Alam',
      'priceRange': 'Rp 1.200.000 - Rp 2.500.000',
      'roomsAvailable': 3,
      'address': 'Jl. Gunung No. 5, Bandung',
    },
    {
      'seed': 'kost8',
      'name': 'Kost Strategis',
      'priceRange': 'Rp 300.000 - Rp 500.000',
      'roomsAvailable': 4,
      'address': 'Jl. Raya No. 15, Surabaya',
    },
    {
      'seed': 'apartment9',
      'name': 'Apartemen Elegan',
      'priceRange': 'Rp 1.800.000 - Rp 3.200.000',
      'roomsAvailable': 2,
      'address': 'Jl. Gatot Subroto No. 20, Jakarta',
    },
    {
      'seed': 'villa10',
      'name': 'Villa Pantai',
      'priceRange': 'Rp 3.000.000 - Rp 5.000.000',
      'roomsAvailable': 6,
      'address': 'Jl. Pantai Barat No. 8, Bali',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Explore'),
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: properties.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final property = properties[index];
                  final imageUrl =
                      'https://picsum.photos/seed/${property['seed']}/300/200';

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PropertyDetailPage(),
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
                                    child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  color: Colors.white,
                                  child: Icon(Icons.broken_image,
                                      size: 50, color: Colors.grey[600]),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 18, 8, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                Text(
                                  property['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  property['priceRange'],
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 4),
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
                                            color: Colors.grey[700]),
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
