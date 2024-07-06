import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;

Future<Map<String, dynamic>?> getPolyLine(
    double latStart, double longStart, double latDest, double longDest) async {
  Set<Polyline> polylineset = {};
  List<LatLng> polyline_cordinate = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String apiKey =
      'AIzaSyCl_KkP13mNm6W70N0osF_E2ADNa3bDTIc'; // Replace with your actual API key
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$latStart,$longStart&destination=$latDest,$longDest&key=$apiKey";

  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    var point = responseBody['routes'][0]['overview_polyline']['points'];
    List<PointLatLng> result = polylinePoints.decodePolyline(point);
    if (result.isNotEmpty) {
      for (var pointlatlong in result) {
        polyline_cordinate
            .add(LatLng(pointlatlong.latitude, pointlatlong.longitude));
      }
    }
    Polyline polyline = Polyline(
      polylineId: const PolylineId("line"),
      color: const Color.fromRGBO(36, 101, 187, 1),
      width: 5,
      points: polyline_cordinate,
    );
    polylineset.add(polyline);

    // Extract distance and duration
    var legs = responseBody['routes'][0]['legs'];
    if (legs != null && legs.isNotEmpty) {
      var leg = legs[0];
      String distanceText =
          leg['distance']['text']; // المسافة كنص مثل "10.1 km"
      String durationText =
          leg['duration']['text']; // الوقت المستغرق كنص مثل "25 دقيقة"
      double distanceInKm =
          double.parse(distanceText.replaceAll(RegExp(r'[^\d\.]'), ''));
      return {
        'polylines': polylineset,
        'distance': distanceInKm,
        'duration': durationText,
      };
    }
  }
  return null;
}
