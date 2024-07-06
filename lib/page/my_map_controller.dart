import 'dart:async';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';

class MyGoogleMapChosseLocationController extends GetxController {
  CameraPosition initialPosition =
      CameraPosition(target: LatLng(31.024054, 31.417328), zoom: 14.45);
  Completer<GoogleMapController>? googleMapController;
  List<Marker> markers = [];
  bool isTimerRunning = false;
  List<Placemark>? placemarks;
  LatLng? latlng;
  String? localityname;
  String? darkMapStyle;

  addMarkers(double lat, double long) {
    markers.add(Marker(markerId: MarkerId("1"), position: LatLng(lat, long)));
    if (markers.length > 3) {
      markers.removeAt(2);
    }
    print("=========markers.length ${markers.length}===========");
    update();
  }

  getLocationDetails(LatLng location) async {
    latlng = location;
    addMarkers(location.latitude, location.longitude);

    placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    Placemark place = placemarks![0];
    print("=============================");
    print("Place Name: ${place.name}");
    print("Locality: ${place.locality}");
    print("Sublocality: ${place.subLocality}");
    print("Thoroughfare: ${place.thoroughfare}");
    print("SubThoroughfare: ${place.subThoroughfare}");
    print("=============================");

    if (placemarks!.isNotEmpty) {
      localityname = place.locality;
    }
  }

  goToHome() {
    if (localityname != null) {
      Get.back(result: {
        "lat": latlng!.latitude,
        "long": latlng!.longitude,
        "name": localityname,
      });
    }
  }

  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    final controller = await googleMapController!.future;
    // ignore: deprecated_member_use
    controller.setMapStyle(darkMapStyle);
  }

  void onMapCreated(GoogleMapController controller) {
    if (!googleMapController!.isCompleted) {
      googleMapController!.complete(controller);
      controller.getZoomLevel();
    }
  }

  @override
  void onInit() {
    super.onInit();
    googleMapController = Completer<GoogleMapController>();
    _loadMapStyles();
  }
}
