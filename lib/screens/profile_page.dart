import 'package:flutter/material.dart';
import 'package:projectuts/screens/home_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/pro4.jpg"),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Nama Pengguna',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                'email@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Divider(),
            const SizedBox(height: 10),
            Text(
              'Informasi Tambahan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Nomor Telepon'),
              subtitle: Text('+62 123 456 7890'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Alamat'),
              subtitle: Text('Jl. Contoh Alamat No. 123, Jakarta, Indonesia'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Tanggal Lahir'),
              subtitle: Text('01 Januari 1990'),
            ),
          ],
        ),
      ),
    );
  }
}
