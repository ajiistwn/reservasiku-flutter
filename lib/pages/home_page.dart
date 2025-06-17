// Import pustaka Material untuk membuat UI Flutter
import 'package:flutter/material.dart';

// Import drawer navigasi dari folder lokal
import '../app_drawer.dart';
// Import halaman eksplorasi tujuan
import './explore_page.dart';

/// Halaman utama aplikasi sebagai entry point tampilan
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar di atas layar
      appBar: AppBar(
        title: Text('Home'), // Judul AppBar
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // Logo kecil di kiri AppBar
          child: Image.asset('images/logo.png'),
        ),
        actions: [
          // Tombol menu di kanan atas
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () =>
                  Scaffold.of(context).openEndDrawer(), // Buka drawer kanan
            ),
          ),
        ],
      ),

      // Drawer yang muncul dari kanan
      endDrawer: AppDrawer(),

      // Body utama halaman
      body: Stack(
        fit: StackFit.expand, // Isi penuh layar
        children: [
          // Gambar latar belakang halaman home
          Image.asset(
            'images/homeImage.jpeg',
            fit: BoxFit.cover, // Gambar disesuaikan ke layar
          ),
          // Lapisan hitam transparan di atas gambar untuk efek gelap
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Konten utama di tengah layar
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Judul utama aplikasi
                  Text(
                    'RESERVASIKU.COM',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Deskripsi singkat
                  Text(
                    'Explore all your dreams with peace of mind. With us guaranteed safe, easy and cheap.Enjoy your holliday we ensure your comfort.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black45,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Form reservasi di tengah halaman
                  FormReservation(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget form pemesanan (reservasi) yang memiliki state (check-in & check-out)
class FormReservation extends StatefulWidget {
  @override
  _FormReservationState createState() => _FormReservationState();
}

class _FormReservationState extends State<FormReservation> {
  // Variabel untuk menyimpan tanggal check-in dan check-out
  String _checkInDate = '';
  String _checkOutDate = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 380), // Atur lebar maksimal form
        child: Container(
          padding: EdgeInsets.all(20), // Padding dalam box
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Input field negara tujuan
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Input field kota tujuan
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Input tanggal check-in (hanya bisa dipilih lewat picker)
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Check In',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                controller: TextEditingController(text: _checkInDate),
                onTap: () async {
                  // Tampilkan date picker
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  // Jika tanggal dipilih, tampilkan time picker
                  if (pickedDate != null) {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    // Gabungkan date dan time menjadi satu format
                    if (pickedTime != null) {
                      final combinedDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );

                      setState(() {
                        _checkInDate = formatDateTime(combinedDateTime);
                      });
                    }
                  }
                },
              ),
              const SizedBox(height: 10),
              // Input tanggal check-out
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Check Out',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                controller: TextEditingController(text: _checkOutDate),
                onTap: () async {
                  // Proses pemilihan tanggal dan waktu check-out
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      final combinedDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );

                      setState(() {
                        _checkOutDate = formatDateTime(combinedDateTime);
                      });
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              // Tombol untuk eksplorasi setelah form diisi
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigasi ke halaman Explore
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExplorePage()),
                    );
                  },
                  child: Text(
                    'Explore',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Fungsi utilitas untuk memformat `DateTime` menjadi string yang mudah dibaca
String formatDateTime(DateTime dateTime) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String day = twoDigits(dateTime.day);
  String month = twoDigits(dateTime.month);
  String year = dateTime.year.toString();
  String hour = twoDigits(dateTime.hour);
  String minute = twoDigits(dateTime.minute);

  // Format akhir: DD/MM/YYYY HH:MM
  return "$day/$month/$year $hour:$minute";
}
