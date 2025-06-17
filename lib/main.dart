import 'package:flutter/material.dart';
import './pages/home_page.dart'; // Mengimpor halaman utama aplikasi (HomePage)

/// Fungsi utama yang akan dipanggil pertama kali ketika aplikasi dijalankan.
/// Memanggil widget MyApp sebagai root dari aplikasi.
void main() {
  runApp(MyApp());
}

/// Widget utama aplikasi, bersifat stateless karena tidak memiliki state.
/// MyApp akan membungkus seluruh aplikasi dengan MaterialApp.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Drawer Navigation', // Judul aplikasi (opsional, muncul saat multitasking)
      debugShowCheckedModeBanner:
          false, // Menghilangkan label "debug" di pojok kanan atas
      home:
          HomePage(), // Menetapkan halaman pertama yang ditampilkan saat aplikasi dibuka
    );
  }
}
