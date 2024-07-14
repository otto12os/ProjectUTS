import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  List<Map<String, dynamic>> busStops = [
    {
      "name": "Kampus A",
      "time": "08.00 WIB",
      "lat": -7.578134,
      "lng": 110.809209
    },
    {
      "name": "Kampus E",
      "time": "08.45 WIB",
      "lat": -7.579295,
      "lng": 110.803255
    },
    {
      "name": "Kampus D",
      "time": "09.00 WIB",
      "lat": -7.565429,
      "lng": 110.794670
    },
    {
      "name": "Kampus B",
      "time": "09.50 WIB",
      "lat": -7.541223,
      "lng": 110.818186
    },
    {
      "name": "Kampus C",
      "time": "10.50 WIB",
      "lat": -7.554195,
      "lng": 110.826762
    }
  ];

  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getPolylines();
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

  Future<void> _getPolylines() async {
    String apiKey = 'AIzaSyCznewqlKgGRHPNRXf94SGD2lqiQ4vq0_k';
    String url = 'https://maps.googleapis.com/maps/api/directions/json?'
        'origin=${busStops.first["lat"]},${busStops.first["lng"]}&'
        'destination=${busStops.last["lat"]},${busStops.last["lng"]}&'
        'waypoints=${busStops.sublist(1, busStops.length - 1).map((e) => '${e["lat"]},${e["lng"]}').join('|')}&'
        'key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var routes = json['routes'][0];
      var polyline = routes['overview_polyline']['points'];
      var polylinePoints = _decodePolyline(polyline);

      setState(() {
        polylines.add(Polyline(
          polylineId: PolylineId('busRoute'),
          color: Colors.red, // Changed to red for visibility
          width: 5,
          points: polylinePoints,
        ));
      });
    } else {
      throw Exception('Failed to load directions');
    }
  }

  List<LatLng> _decodePolyline(String polyline) {
    List<LatLng> points = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rute Bus Kampus'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-7.555714, 110.814991), // posisi tengah
              zoom: 13.5, // Zoom level
            ),
            markers: markers,
            polylines: polylines,
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
