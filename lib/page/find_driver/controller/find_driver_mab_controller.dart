// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';
import 'package:indriveclone/shared/mixin/google_map_services_controller.dart';

class FindDriverMabController extends GetxController
    with CoustomGoogleMapMixIn {
  Set<Polyline> polylineSet = {};

  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];
  List<DriverModel> drivers = [];

  double? fromLat;
  double? fromLong;
  double? toLat;
  double? toLong;
  bool isContainerActive = true;

  void changeContainerStatus(bool isCameraMoving) {
    isContainerActive = isCameraMoving;
    update();
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
    update();
  }

  void initPolyLine(Set<Polyline> po) {
    polylineSet = po;
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
  void getCurrentLocation() {
    initialPosition =
        CameraPosition(target: LatLng(fromLat!, fromLong!), zoom: 14);
  }

  @override
  void onMapCreated(GoogleMapController controller) {
    Get.find<FindDriverController>().changeStatusRequset(StatusRequest.loading);
    googleMapController = controller;
    Get.find<FindDriverController>().changeStatusRequset(StatusRequest.success);
    super.loadMapStyles();
  }

  @override
  void onInit() {
    super.onInit();
    toLat = Get.arguments["tolat"];
    toLong = Get.arguments["tolong"];
    fromLat = Get.arguments["fromlat"];
    fromLong = Get.arguments["fromlong"];
    drivers = Get.arguments["data"];
    getCurrentLocation();
    addMarkers();
    initPolyLine(Get.arguments["po_set"]);
  }

  @override
  void onClose() {
    super.onClose();
    googleMapController!.dispose();
  }
}
