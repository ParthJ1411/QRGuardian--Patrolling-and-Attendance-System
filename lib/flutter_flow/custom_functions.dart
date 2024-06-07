import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isWithinRadius(
  LatLng staticLocation,
  LatLng movingLocation,
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

DateTime getTodayFirstHour() {
  return DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
}
