import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/mixin/google_map_services_controller.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';

class FindDriverController extends GetxController with CoustomGoogleMapMixIn {
  // initialPosition =
  //     const CameraPosition(target: LatLng(31.024054, 31.417328), zoom: 14.45);

  Set<Polyline> polylineSet = {};
  double? distance;
  double? time;
  List<Marker> markers = [];
  List<DriverModel> drivers = [];
  late int driverid;
  late DriverModel selectedDriverData;
  int? fare;
  double? fromLat;
  double? fromLong;
  double? toLat;
  double? toLong;

  void selectedDriver(int index) {
    selectedDriverData = drivers[index];
  }

  void addMarkers() {
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId("userfrom"),
        position: LatLng(fromLat!, fromLong!)));
    markers.add(Marker(
        markerId: const MarkerId("userto"), position: LatLng(toLat!, toLong!)));
    for (var driver in drivers) {
      markers.add(Marker(
        markerId: MarkerId(driver.driverName!),
        position: LatLng(driver.driverLatitude!, driver.driverLongitude!),
        infoWindow: InfoWindow(
          title: driver.driverName,
          snippet: "${driver.driverCarModel}",
        ),
      ));
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

  @override
  void onInit() {
    super.onInit();
    googleMapController = Completer<GoogleMapController>();
    fare = Get.arguments["fare"];
    toLat = Get.arguments["tolat"];
    toLong = Get.arguments["tolong"];
    fromLat = Get.arguments["fromlat"];
    fromLong = Get.arguments["fromlong"];
    drivers = Get.arguments["data"];
    addMarkers();
    loadMapStyles();
    initPolyLine();
    getCurrentLocation();
  }

  goToTrackingView() {
    if (time != null) {
      Get.offAllNamed(AppRoute.trackingtohome, arguments: {
        "userfromlat": fromLat,
        "userfromlong": fromLong,
        "usertolat": toLat,
        "usertolong": toLong,
        "driverfromlat": selectedDriverData.driverLatitude,
        "driverfromlong": selectedDriverData.driverLongitude,
        "polylinefromtouser": polylineSet,
        "distanceusertohome": distance,
        "timeusertohome": time,
      });
    }
  }
}
