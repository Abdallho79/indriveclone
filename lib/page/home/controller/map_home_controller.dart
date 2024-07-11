import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/core/services/services.dart';

import '../../../shared/google_map_services_controller.dart';

class MapHomeController extends GetxController with CoustomGoogleMap {
  MyServices myServices = Get.find();
  Set<Polyline> polylineSet = {};
  double? distance;
  double? time;
  double? initialLat;
  double? initialLong;

  List<Marker> markers = [];
  bool isContainerActive = true;

  // Toggle the status of the container based on camera movement
  void changeContainerStatus(bool isCameraMoving) {
    isContainerActive = isCameraMoving;
    update();
  }

  // Initialize Google Map controller when the map is created

  // Add or update markers on the map
  void addMarkers(double lat, double long, bool isFrom) {
    String markerId = isFrom ? "from" : "to";
    Marker marker = Marker(
      markerId: MarkerId(markerId),
      position: LatLng(lat, long),
    );
    int index = markers.indexWhere((m) => m.markerId.value == markerId);
    if (index != -1) {
      markers[index] = marker;
    } else {
      markers.add(marker);
    }
    update();
  }

// Draw polyline between two points on the map
  Future<Map> drawPolyline(
      double fromLat, double fromLong, double toLat, double toLong) async {
    // Clear the old polyline coordinates and polylines
    Map<String, dynamic>? data =
        await getPolyLine(fromLat, fromLong, toLat, toLong, "user_line");
    await Future.delayed(const Duration(seconds: 1));
    polylineSet = data!["polylines"];
    distance = data["distance"];
    time = data["duration"];
    update();
    return data;
  }

  // Get the current location of the user and update the initial position
  getCurrentLocation() {
    initialLat = myServices.sharedPreferences.getDouble("lat");
    initialLong = myServices.sharedPreferences.getDouble("long");
    initialPosition =
        CameraPosition(target: LatLng(initialLat!, initialLong!), zoom: 14);
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    googleMapController = Completer<GoogleMapController>();
    loadMapStyles();
  }
}
