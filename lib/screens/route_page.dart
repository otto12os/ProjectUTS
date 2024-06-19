import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  List<Map<String, String>> busStops = [
    {"name": "Kampus A", "time": "08.00 WIB"},
    {"name": "Kampus E", "time": "08.45 WIB"},
    {"name": "Kampus D", "time": "09.00 WIB"},
    {"name": "Kampus B", "time": "09.50 WIB"},
    {"name": "Kampus A", "time": "10.00 WIB"},
    {"name": "Gedung Rektorat", "time": "10.30 WIB"},
    {"name": "Kampus C", "time": "10.50 WIB"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Dan Rute Bus Kampus'),
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
            onTap: () {},
          );
        },
      ),
    );
  }
}
