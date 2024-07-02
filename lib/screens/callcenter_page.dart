import 'package:flutter/material.dart';

class CallCenterPage extends StatefulWidget {
  @override
  _CallCenterPageState createState() => _CallCenterPageState();
}

class _CallCenterPageState extends State<CallCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Center'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSectionTitle('Hubungi Kami'),
            _buildCallCenterItem(
              icon: Icons.local_hospital,
              title: 'Rumah Sakit Kampus',
              number: '0857-1234-5678',
            ),
            _buildCallCenterItem(
              icon: Icons.school,
              title: 'Kantor Akademik Kampus',
              number: '0271-3234-3211',
            ),
            _buildCallCenterItem(
              icon: Icons.security,
              title: 'Keamanan Kampus',
              number: '5555-5555-5555',
            ),
            SizedBox(height: 20.0),
            _buildSectionTitle('Jam Kerja'),
            _buildWorkingHoursItem(
              day: 'Senin - Jumat',
              hours: '08:00 - 16:00',
            ),
            _buildWorkingHoursItem(
              day: 'Sabtu - Minggu',
              hours: '08:00 - 12:00',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildCallCenterItem({required IconData icon, required String title, required String number}) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(number),
        trailing: IconButton(
          icon: Icon(Icons.call),
          color: Colors.green,
          onPressed: () {
          },
        ),
      ),
    );
  }

  Widget _buildWorkingHoursItem({required String day, required String hours}) {
    return ListTile(
      title: Text(
        day,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(hours),
    );
  }
}