import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const GeoLoc());
}

class GeoLoc extends StatefulWidget {
  const GeoLoc({Key? key}) : super(key: key);

  @override
  State<GeoLoc> createState() => _GeoLocState();
}

double? lat;
double? lon;

class _GeoLocState extends State<GeoLoc> {
// task 3

  @override
  initState() {
    checklocationStatus();
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print('called');
    setState(() {
      lat = position.latitude;
      lon = position.longitude;
    });
    print(position.latitude);
    print(position.longitude);
  }

  // Task 2
  void checklocationStatus() async {
    LocationPermission Permissions = await Geolocator.checkPermission();
    if (Permissions == LocationPermission.denied) {
      print("Permission Denied");
    } else {
      print("Permission Allowed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lab 8'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    getLocation();
                    // task 2
                    checklocationStatus();
                  },
                  icon: Icon(Icons.location_on)),

              // task 3
              Text(
                '$lat',
              ),
              Text(
                '$lon',
              )
            ],
          ),
        ),
      ),
    );
  }
}