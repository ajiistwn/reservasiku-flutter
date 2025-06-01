import 'package:flutter/material.dart';
import '../app_drawer.dart';
import './home_page.dart';

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
      'seed': 'guest3',
      'name': 'Guest House Nyaman',
      'priceRange': 'Rp 750.000 - Rp 1.200.000',
      'roomsAvailable': 4,
      'address': 'Jl. Bunga Raya No. 5, Bandung',
    },
    {
      'seed': 'apartment4',
      'name': 'Apartment Modern',
      'priceRange': 'Rp 1.500.000 - Rp 3.000.000',
      'roomsAvailable': 2,
      'address': 'Jl. Sudirman No. 88, Surabaya',
    },
    {
      'seed': 'villa5',
      'name': 'Villa Tropis',
      'priceRange': 'Rp 2.500.000 - Rp 4.000.000',
      'roomsAvailable': 6,
      'address': 'Jl. Pantai Indah No. 10, Bali',
    },
    {
      'seed': 'kost6',
      'name': 'Kost Murah Meriah',
      'priceRange': 'Rp 300.000 - Rp 500.000',
      'roomsAvailable': 8,
      'address': 'Jl. Kebon Jeruk No. 15, Jakarta',
    },
    {
      'seed': 'guest7',
      'name': 'Guest House Elegan',
      'priceRange': 'Rp 900.000 - Rp 1.500.000',
      'roomsAvailable': 3,
      'address': 'Jl. Cihampelas No. 20, Bandung',
    },
    {
      'seed': 'apartment8',
      'name': 'Apartment Mewah',
      'priceRange': 'Rp 2.000.000 - Rp 3.500.000',
      'roomsAvailable': 1,
      'address': 'Jl. Thamrin No. 45, Jakarta',
    },
    {
      'seed': 'villa9',
      'name': 'Villa Alam Indah',
      'priceRange': 'Rp 1.800.000 - Rp 3.000.000',
      'roomsAvailable': 4,
      'address': 'Jl. Raya Puncak No. 12, Bogor',
    },
    {
      'seed': 'kost10',
      'name': 'Kost Premium',
      'priceRange': 'Rp 600.000 - Rp 900.000',
      'roomsAvailable': 2,
      'address': 'Jl. Setiabudi No. 30, Jakarta',
    },
    {
      'seed': 'guest11',
      'name': 'Guest House Cozy',
      'priceRange': 'Rp 800.000 - Rp 1.200.000',
      'roomsAvailable': 5,
      'address': 'Jl. Braga No. 18, Bandung',
    },
    {
      'seed': 'apartment12',
      'name': 'Apartment Stylish',
      'priceRange': 'Rp 1.700.000 - Rp 2.800.000',
      'roomsAvailable': 3,
      'address': 'Jl. Gajah Mada No. 50, Surabaya',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(1),
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
            // FormReservation(), // widget form reservasi di atas
            // SizedBox(height: 20),
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
                  return Card(
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
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(child: CircularProgressIndicator());
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
