// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/shared/mixin/google_map_services_controller.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';

class FindDriverController extends GetxController with CoustomGoogleMapMixIn {
  Set<Polyline> polylineSet = {};
  double? distance;
  double? time;
  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];
  List<DriverModel> drivers = [];

  late int driverid;
  late DriverModel selectedDriverData;

  int? fare;
  double? fromLat;
  double? fromLong;
  double? toLat;
  double? toLong;
    Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }
  changeStatusRequset(StatusRequest status) {
    statusRequest = status;
    update();
  }

  void selectedDriver(int index) {
    selectedDriverData = drivers[index];
    goToTrackingView();
  }

  @override
  onMapCreated(GoogleMapController controller) {
    changeStatusRequset(StatusRequest.loading);
    googleMapController = controller;
    changeStatusRequset(StatusRequest.success);
    super.loadMapStyles();
  }

  void addMarkers() async {
    markers.clear();
    await setCoustomIconn(1);
    markers.add(Marker(
        markerId: const MarkerId("userfrom"),
        position: LatLng(fromLat!, fromLong!),
        icon: BitmapDescriptor.fromBytes(customMarker)));
    await setCoustomIconn(2);
    markers.add(Marker(
        markerId: const MarkerId("userto"),
        position: LatLng(toLat!, toLong!),
        icon: BitmapDescriptor.fromBytes(customMarker)));
    await setCoustomIconn(3);
    for (var driver in drivers) {
      markers.add(Marker(
          markerId: MarkerId(driver.driverName!),
          position: LatLng(driver.driverLatitude!, driver.driverLongitude!),
          infoWindow: InfoWindow(
            title: driver.driverName,
            snippet: "${driver.driverCarModel}",
          ),
          icon: BitmapDescriptor.fromBytes(customMarker)));
    }
  }

  initPolyLine() async {
    Map<String, dynamic>? data =
        await getPolyLine(fromLat!, fromLong!, toLat!, toLong!, "user_line");
    await Future.delayed(const Duration(seconds: 1));
    polylineSet = data!["polylines"];
    distance = data["distance"];
    time = data["duration"];
    update();
  }

  @override
  getCurrentLocation() {
    initialPosition =
        CameraPosition(target: LatLng(fromLat!, fromLong!), zoom: 14);
  }

  Future<void> changeCameraPosition(double lat, double long) async {
    await googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: 14.0,
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    fare = Get.arguments["fare"];
    toLat = Get.arguments["tolat"];
    toLong = Get.arguments["tolong"];
    fromLat = Get.arguments["fromlat"];
    fromLong = Get.arguments["fromlong"];
    drivers = Get.arguments["data"];
    addMarkers();
    initPolyLine();
    getCurrentLocation();
  }

  goToTrackingView() {
    if (time != null) {
      print("=====32=======${polylineSet.toString()}===========");
      Get.offAllNamed(AppRoute.trackingtohome, arguments: {
        "selectedDriverData": selectedDriverData,
        "distance": distance,
        "timeusertohome": time,
        "fare": fare,
        "usertolat": toLat,
        "usertolong": toLong,
        "userfromlat": fromLat,
        "userfromlong": fromLong,
        "po": polylineSet,
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    googleMapController!.dispose();
  }
}
