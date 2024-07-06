import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/function/polyline.dart';

class FindDriverController extends GetxController {
  CameraPosition initialPosition =
      CameraPosition(target: LatLng(31.024054, 31.417328), zoom: 14.45);
  String? darkMapStyle;
  Completer<GoogleMapController>? googleMapController;
  Set<Polyline> polylineSet = {};
  double? distance;
  String? time;
  List<Marker> markers = [];

  int? fare;
  double? fromLat;
  double? fromLong;
  double? toLat;
  double? toLong;
  void onMapCreated(GoogleMapController controller) {
    if (!googleMapController!.isCompleted) {
      googleMapController!.complete(controller);
      controller.getZoomLevel();
    }
  }

  addMarkers() {
    markers.add(Marker(
        markerId: MarkerId("from"), position: LatLng(fromLat!, fromLong!)));

    markers.add(
        Marker(markerId: MarkerId("to"), position: LatLng(toLat!, toLong!)));
  }

  // تحميل أسلوب الخريطة المظلم
  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    final controller = await googleMapController!.future;
    controller.setMapStyle(darkMapStyle);
  }

  initPolyLine() async {
    Map<String, dynamic>? data =
        await getPolyLine(fromLat!, fromLong!, toLat!, toLong!);
    await Future.delayed(Duration(seconds: 1));
    polylineSet = data!["polylines"];
    distance = data["distance"];
    time = data["duration"];

    update();
  }

  @override
  void onInit() {
    googleMapController = Completer<GoogleMapController>();
    fare =  32;
    toLat = 31.014054;
    toLong =31.024054;
    fromLat = 31.014054;
    fromLong =  31.024054;

    super.onInit();

    addMarkers();
    _loadMapStyles();
    initPolyLine();
  }
}
