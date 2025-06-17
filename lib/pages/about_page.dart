// Import library Flutter Material untuk elemen UI standar
import 'package:flutter/material.dart';

// Import komponen drawer dari file lokal
import '../app_drawer.dart';

/// Halaman About Us yang menampilkan informasi tentang Reservasiku
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar di bagian atas halaman
      appBar: AppBar(
        title: Text('About Us'), // Judul AppBar
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // Logo kecil di kiri AppBar
          child: Image.asset('images/logo.png'), // Ganti dengan path logo
        ),
        actions: [
          // Tombol menu drawer di kanan atas
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context)
                  .openEndDrawer(), // Buka drawer dari kanan
            ),
          ),
        ],
      ),

      // Drawer navigasi yang muncul dari sisi kanan
      endDrawer: AppDrawer(),

      // Konten utama halaman
      body: SingleChildScrollView(
        // Membungkus konten agar bisa di-scroll bila melebihi layar
        child: Padding(
          padding: const EdgeInsets.all(20), // Padding untuk keseluruhan konten
          child: Column(
            children: [
              // Gambar ilustrasi tentang perusahaan
              Image.asset(
                'images/aboutImage.jpg', // Ganti sesuai gambar yang digunakan
                width: 500,
                height: 400,
                fit: BoxFit.cover, // Gambar disesuaikan agar memenuhi area
              ),
              const SizedBox(height: 30), // Jarak antar elemen

              // Judul bagian "About Us"
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Paragraf deskripsi tentang Reservasiku
              Text(
                'Reservasiku.com is a digital platform that makes it easy for users to book rooms and accommodations quickly, safely, and conveniently. We offer a modern solution for lodging needs from individual rooms in villas to exclusive stays with a smooth and transparent booking experience. To become Indonesia’s leading accommodation booking platform, prioritizing accessibility, user comfort, and exceptional stay experiences.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5, // Jarak antar baris
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify, // Rata kanan kiri
              ),
            ],
          ),
        ),
      ),
    );
  }
}
