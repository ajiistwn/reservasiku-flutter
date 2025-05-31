import 'package:flutter/material.dart';
import '../app_drawer.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
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
      body: Center(child: Text('Ini adalah halaman Explore')),
    );
  }
}
