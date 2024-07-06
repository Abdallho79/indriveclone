import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';

mixin GoogleMapServicesController {
  String? darkMapStyle;
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(31.024054, 31.417328), zoom: 14.45);
  Completer<GoogleMapController>? googleMapController;
  List<Marker> markers = [];

  Future loadMapStyles() async {
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

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    initialPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14.45);
  }
}
