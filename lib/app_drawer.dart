import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/about_page.dart';
import './pages/explore_page.dart';

/// Widget ini merupakan komponen Drawer (menu samping)
/// yang digunakan di aplikasi untuk navigasi antar halaman.
/// Komponen ini ditampilkan saat pengguna mengetuk ikon menu di AppBar.
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ListView digunakan untuk menampilkan daftar item dalam Drawer
        children: [
          // Header Drawer yang menampilkan gambar dan teks "Menu"
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
              image: DecorationImage(
                // Gambar background header dari folder aset
                image: AssetImage('images/aboutImage.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  // Memberi efek overlay gelap pada gambar
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          // Item menu: Home
          ListTile(
            leading: Icon(Icons.home), // Ikon Home
            title: Text('Home'), // Label teks
            onTap: () {
              // Navigasi ke halaman Home
              // pushReplacement akan mengganti halaman saat ini
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),

          // Item menu: Explore Now
          ListTile(
            leading: Icon(Icons.explore),
            title: Text('Explore Now'),
            onTap: () {
              // Navigasi ke halaman Explore
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ExplorePage()),
              );
            },
          ),

          // Item menu: About Us
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              // Navigasi ke halaman About
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
