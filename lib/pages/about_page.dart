import 'package:flutter/material.dart';
import '../app_drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'), // ganti dengan path logo kamu
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
            children: [
              Image.asset(
                'images/aboutImage.jpg', // Ganti sesuai nama file gambar perusahaan kamu
                width: 500,
                height: 400,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30),
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
              Text(
                'Reservasiku.com is a digital platform that makes it easy for users to book rooms and accommodations quickly, safely, and conveniently. We offer a modern solution for lodging needs from individual rooms in villas to exclusive stays with a smooth and transparent booking experience. To become Indonesia’s leading accommodation booking platform, prioritizing accessibility, user comfort, and exceptional stay experiences.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
