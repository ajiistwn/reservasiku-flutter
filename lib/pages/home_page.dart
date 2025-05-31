import 'package:flutter/material.dart';
import '../app_drawer.dart';
import './explore_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/homeImage.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  Text(
                    'Enjoy Your Holiday – We Ensure Your Comfort',
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
                  FormReservation(), // <-- ini widget form yang stateful
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormReservation extends StatefulWidget {
  @override
  _FormReservationState createState() => _FormReservationState();
}

class _FormReservationState extends State<FormReservation> {
  String _checkInDate = '';
  String _checkOutDate = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 380),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Check In',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    ),
                  ),
                  controller: TextEditingController(text: _checkInDate),
                  onTap: () async {
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
                          _checkInDate = formatDateTime(combinedDateTime);
                        });
                      }
                    }
                  }),
              const SizedBox(height: 10),
              TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Check Out',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    ),
                  ),
                  controller: TextEditingController(text: _checkOutDate),
                  onTap: () async {
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
                  }),
              const SizedBox(height: 20),
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

String formatDateTime(DateTime dateTime) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String day = twoDigits(dateTime.day);
  String month = twoDigits(dateTime.month);
  String year = dateTime.year.toString();
  String hour = twoDigits(dateTime.hour);
  String minute = twoDigits(dateTime.minute);
  return "$day/$month/$year $hour:$minute";
}
