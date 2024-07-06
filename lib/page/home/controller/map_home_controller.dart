import 'dart:async';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';

class MapHomeController extends GetxController {
  Set<Polyline> polylineSet = {};
  double distance = 0;
  String? time;

  CameraPosition initialPosition =
      CameraPosition(target: LatLng(31.024054, 31.417328), zoom: 14.45);
  Completer<GoogleMapController>? googleMapController;
  List<Marker> markers = [];
  bool isContainerActive = true;
  String? darkMapStyle;

  @override
  void onInit() {
    super.onInit();
    googleMapController = Completer<GoogleMapController>();
    _loadMapStyles();
  }

  // Load dark map style from assets
  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    final controller = await googleMapController!.future;
    controller.setMapStyle(darkMapStyle);
  }

  // Toggle the status of the container based on camera movement
  void changeContainerStatus(bool isCameraMoving) {
    isContainerActive = isCameraMoving;
    update();
  }

  // Initialize Google Map controller when the map is created
  void onMapCreated(GoogleMapController controller) {
    if (!googleMapController!.isCompleted) {
      googleMapController!.complete(controller);
    }
  }

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
        await getPolyLine(fromLat, fromLong, toLat, toLong);
    await Future.delayed(Duration(seconds: 1));
    polylineSet = data!["polylines"];
    distance = data["distance"];
    time = data["duration"];
    print("====================");
    print(distance);
    print(time);
    print("====================");
    update();
    return data;
  }

  // Get the current location of the user and update the initial position
  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    HomeController homeController = Get.find();
    homeController.initialLat = position.latitude;
    homeController.initialLong = position.longitude;

    initialPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14.45);

    update();
  }
}
