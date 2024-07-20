import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/core/services/services.dart';

import '../../../shared/mixin/google_map_services_controller.dart';

class MapHomeController extends GetxController with CoustomGoogleMapMixIn {
  MyServices myServices = Get.find();
  Set<Polyline> polylineSet = {};
  double? distance;
  double? time;
  double? initialLat;
  double? initialLong;
  StatusRequest statusRequest = StatusRequest.none;

  List<Marker> markers = [];
  bool isContainerActive = true;

  void changeContainerStatus(bool isCameraMoving) {
    isContainerActive = isCameraMoving;
  }

  changeStatusRequset(StatusRequest status) {
    statusRequest = status;
    update();
  }

  @override
  onMapCreated(GoogleMapController controller) {
    changeStatusRequset(StatusRequest.loading);
    googleMapController = controller;
    changeStatusRequset(StatusRequest.success);
    loadMapStyles();
  }

  void addMarkers(double lat, double long, bool isFrom) async {
    int type = isFrom ? 1 : 2;
    await setCoustomIconn(type);
    String markerId = isFrom ? "from" : "to";

    Marker marker = Marker(
        markerId: MarkerId(markerId),
        position: LatLng(lat, long),
        // ignore: deprecated_member_use
        icon: BitmapDescriptor.fromBytes(customMarker));

    int index = markers.indexWhere((m) => m.markerId.value == markerId);
    if (index != -1) {
      markers[index] = marker;
    } else {
      markers.add(marker);
    }
    update();
  }

  Future<Map> drawPolyline(
      double fromLat, double fromLong, double toLat, double toLong) async {
    Map<String, dynamic>? data =
        await getPolyLine(fromLat, fromLong, toLat, toLong, "user_line");
    await Future.delayed(const Duration(seconds: 1));
    polylineSet = data!["polylines"];
    distance = data["distance"];
    time = data["duration"];

    return data;
  }

  @override
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
  }

  @override
  void onClose() {
    super.onClose();
    googleMapController!.dispose();
  }
}
