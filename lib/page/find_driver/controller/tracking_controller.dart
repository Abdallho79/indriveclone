// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/find_driver/controller/tracking_controller_map.dart';

class TrackingController extends GetxController {
  late TrackingMapController controller;

  late double driverFromLat;
  late double driverFromLong;
  late double userToLat;
  late double userToLong;
  late double userFromLat;
  late double userFromLong;
  late StreamSubscription<Position> positionstrem;
  Timer? driverToUserTimer;

  StartTimerDriverToUser() {
    driverToUserTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      startTrackingDriverLocation();
    });
  }

  void startTrackingDriverLocation() async {
    FirebaseFirestore.instance
        .collection("driver")
        .doc(controller.selectedDriverData!.driverId.toString())
        .snapshots()
        .listen((event) {
      driverFromLat = event.get("driver_lat");
      driverFromLong = event.get("driver_long");
      controller.updatePolyLine(
          driverFromLat, driverFromLong, userFromLat, userFromLong, "driver");
      controller.updateMarkerAndMoveCamera(
          driverFromLat, driverFromLong, "driver");
    });
  }

  void startTrackingUserLocation() {
    positionstrem = Geolocator.getPositionStream().listen((Position? position) {
      userFromLat = position!.latitude;
      userFromLong = position.longitude;
      controller.updatePolyLine(
          userFromLat, userFromLong, userToLat, userToLong, "user");
      controller.updateMarkerAndMoveCamera(userFromLat, userFromLong, "driver");
    });
  }

  @override
  void onInit() {
    super.onInit();
    controller = Get.find<TrackingMapController>();

    driverFromLong = controller.selectedDriverData!.driverLongitude!;
    driverFromLat = controller.selectedDriverData!.driverLatitude!;
    userToLat = controller.userToLat!;
    userToLong = controller.userToLong!;
    userFromLat = controller.userFromLat!;
    userFromLong = controller.userFromLong!;
    StartTimerDriverToUser();
  }

  @override
  void onClose() {
    positionstrem.cancel();

    if (driverToUserTimer != null && driverToUserTimer!.isActive) {
      driverToUserTimer!.cancel();
    }

    super.onClose();
  }
}
