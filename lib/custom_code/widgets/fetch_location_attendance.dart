// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;
import '/flutter_flow/lat_lng.dart';

// isWithinRadius function definition
bool isWithinRadius(
  LatLng staticLocation, // This is the target location
  LatLng movingLocation, // This is the current device location
  double radiusMeters,
) {
  const double earthRadius = 6371000; // Earth radius in meters

  double radians(double degrees) {
    return degrees * math.pi / 180;
  }

  double lat1 = radians(staticLocation.latitude);
  double lon1 = radians(staticLocation.longitude);
  double lat2 = radians(movingLocation.latitude);
  double lon2 = radians(movingLocation.longitude);

  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dLon / 2) * math.sin(dLon / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distance = earthRadius * c;

  return distance <= radiusMeters;
}

class FetchLocationAttendance extends StatefulWidget {
  const FetchLocationAttendance({
    Key? key,
    this.width,
    this.height,
    this.currentLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? currentLocation;

  @override
  State<FetchLocationAttendance> createState() =>
      _FetchLocationAttendanceState();
}

class _FetchLocationAttendanceState extends State<FetchLocationAttendance> {
  LatLng? _currentLocation;
  String? _errorMessage;
  bool _isWithinRadius = false;

  final LatLng targetLocation8 = LatLng(18.583791901071045, 73.73651857816007);

  Future<void> _fetchLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _errorMessage = null;
        _isWithinRadius = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to get current location';
      });
    }
  }

  void _validateLocation() {
    if (_currentLocation != null) {
      bool isValid = isWithinRadius(
        targetLocation8,
        _currentLocation!,
        20,
      );

      setState(() {
        if (isValid) {
          _isWithinRadius = true;
          _errorMessage = null;

          // Update the state variable for PrideState
          FFAppState().AttendanceState = true;
        } else {
          _isWithinRadius = false;
          _errorMessage =
              'Current location is not within 20 meters of the target location';
        }
      });
    } else {
      setState(() {
        _errorMessage = 'Please fetch the location first';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width ?? 400, // Set your desired width
        height: widget.height ?? 450, // Set your desired height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _fetchLocation,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                backgroundColor: Color(0xFF1C4494), // Custom background color
                foregroundColor: Colors.white,
              ),
              child: Text('Fetch Location'),
            ),
            SizedBox(height: 10),
            if (_currentLocation != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Latitude: ${_currentLocation!.latitude}, Longitude: ${_currentLocation!.longitude}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateLocation,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                backgroundColor: Color(0xFF04A24C), // Custom background color
                foregroundColor: Colors.white,
              ),
              child: Text('Validate Location'),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
