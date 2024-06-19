import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  List<Map<String, String>> busStops = [
    {"name": "Kampus A", "time": "08:00 AM"},
    {"name": "Kampus E", "time": "08:10 AM"},
    {"name": "Kampus A", "time": "08:20 AM"},
    {"name": "Kampus B", "time": "08:30 AM"},
    {"name": "Kampus D", "time": "08:40 AM"},
    {"name": "Gedung Rektorat", "time": "08:50 AM"},
    {"name": "Kampus C", "time": "09:00 AM"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Rute Bus Kampus'),
      ),
      body: ListView.builder(
        itemCount: busStops.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(busStops[index]["name"]!),
            subtitle: Text('Jam Keberangkatan: ${busStops[index]["time"]}'),
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.directions_bus),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Tambahkan aksi ketika item di-tap di sini
            },
          );
        },
      ),
    );
  }
}