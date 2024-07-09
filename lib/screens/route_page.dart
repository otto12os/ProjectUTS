import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  List<Map<String, dynamic>> busStops = [
    {"name": "Kampus A", "time": "08.00 WIB", "lat": -6.2088, "lng": 106.8456},
    {"name": "Kampus E", "time": "08.45 WIB", "lat": -6.2077, "lng": 106.8422},
    {"name": "Kampus D", "time": "09.00 WIB", "lat": -6.2101, "lng": 106.8405},
    {"name": "Kampus B", "time": "09.50 WIB", "lat": -6.2113, "lng": 106.8366},
    {"name": "Kampus A", "time": "10.00 WIB", "lat": -6.2088, "lng": 106.8456},
    {
      "name": "Gedung Rektorat",
      "time": "10.30 WIB",
      "lat": -6.2064,
      "lng": 106.8407
    },
    {"name": "Kampus C", "time": "10.50 WIB", "lat": -6.2080, "lng": 106.8395}
  ];

  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    for (var busStop in busStops) {
      markers.add(Marker(
        markerId: MarkerId(busStop["name"]!),
        position: LatLng(busStop["lat"], busStop["lng"]),
        infoWindow: InfoWindow(
          title: busStop["name"],
          snippet: 'Jam Keberangkatan: ${busStop["time"]}',
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal dan Rute Bus Kampus'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-6.2088, 106.8456),
              zoom: 14.0,
            ),
            markers: markers,
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: busStops.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        mapController!.animateCamera(
                          CameraUpdate.newLatLngZoom(
                            LatLng(
                                busStops[index]["lat"], busStops[index]["lng"]),
                            15.0,
                          ),
                        );
                      },
                      child: Text(busStops[index]["name"]!),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
