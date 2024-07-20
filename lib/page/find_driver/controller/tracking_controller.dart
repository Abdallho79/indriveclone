// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/shared/mixin/google_map_services_controller.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';

class TrackingController extends GetxController with CoustomGoogleMapMixIn {
  Set<Polyline> Polylineset = {};
  Set<Polyline> Polylineset1 = {};
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];

  bool isDriverArrive = false;
  late DriverModel selectedDriverData;

  int? fare;
  double? userFromLat;
  double? userFromLong;
  double? userToLat;
  double? userToLong;
  double? distace;

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

  void addMarkers() async {
    markers.clear();
    await super.setCoustomIconn(1);
    markers.add(Marker(
        icon: BitmapDescriptor.fromBytes(customMarker),
        markerId: const MarkerId("userfrom"),
        position: LatLng(userFromLat!, userFromLong!)));
    await super.setCoustomIconn(2);

    markers.add(Marker(
        icon: BitmapDescriptor.fromBytes(customMarker),
        markerId: const MarkerId("userto"),
        position: LatLng(userToLat!, userToLong!)));
    await super.setCoustomIconn(3);

    markers.add(Marker(
        icon: BitmapDescriptor.fromBytes(customMarker),
        infoWindow: InfoWindow(
          title: selectedDriverData.driverName,
          snippet: "${selectedDriverData.driverCarModel}",
        ),
        markerId: const MarkerId("driver"),
        position: LatLng(selectedDriverData.driverLatitude!,
            selectedDriverData.driverLongitude!)));
  }

  void initPolyLine() async {
    changeStatusRequset(StatusRequest.loading);
    Map<String, dynamic>? data = await getPolyLine(
        selectedDriverData.driverLatitude!,
        selectedDriverData.driverLongitude!,
        userFromLat!,
        userFromLong!,
        "driver_line");
    await Future.delayed(const Duration(seconds: 1));
    if (data != null && data.containsKey('polylines')) {
      Polylineset = data["polylines"];
      distace = data["distance"];
      changeStatusRequset(StatusRequest.success);
    } else {
      changeStatusRequset(StatusRequest.none);
      Get.snackbar("Error", "Please Choose again");
    }
  }

  void driverReachUser() async {
    changeStatusRequset(StatusRequest.loading);
    Polylineset = {};
    Map<String, dynamic>? data = await getPolyLine(
        userFromLat!, userFromLong!, userToLat!, userToLong!, "user_line");
    await Future.delayed(const Duration(seconds: 1));
    if (data != null && data.containsKey('polylines')) {
      Polylineset = data["polylines"];
      distace = data["distance"];
      changeStatusRequset(StatusRequest.success);
    } else {
      changeStatusRequset(StatusRequest.none);
      Get.snackbar("Error", "Please Choose again");
    }
  }

  @override
  void onInit() {
    myServices.sharedPreferences.setBool("isUserInTrackingMood", true);
    fare = Get.arguments["fare"];
    userToLat = Get.arguments["usertolat"];
    userToLong = Get.arguments["usertolong"];
    userFromLat = Get.arguments["userfromlat"];
    userFromLong = Get.arguments["userfromlong"];
    selectedDriverData = Get.arguments["selectedDriverData"];
    Polylineset1 = Get.arguments["po"];

    getCurrentLocation();
    addMarkers();
    initPolyLine();
    super.onInit();
  }

  @override
  void getCurrentLocation() {
    initialPosition =
        CameraPosition(target: LatLng(userFromLat!, userFromLong!), zoom: 14);
  }

  @override
  onMapCreated(GoogleMapController controller) {
    changeStatusRequset(StatusRequest.loading);
    googleMapController = controller;
    changeStatusRequset(StatusRequest.success);
    loadMapStyles();
  }

  @override
  void onClose() {
    super.onClose();
    googleMapController!.dispose();
  }
}














    // driverToUserTimer.cancel();
    // userToHomeTimer.cancel();
    // setTimerDriverToUser();

  // driverNotArriveYet(bool driver_status) {
  //   isDriverArrive = driver_status;

  //   if (driver_status) {
  //     setTimerUserToHome();
  //   } else {
  //     timeDriverToUser = 6;
  //     setTimerDriverToUser();
  //   }

  //   update();
  // }

  // String formatDuration(int seconds) {
  //   int hours = seconds ~/ 3600;
  //   int minutes = (seconds % 3600) ~/ 60;
  //   int secs = seconds % 60;

  //   return '$hours/$minutes/$secs';
  // }

  // setTimerDriverToUser() {
  //   // Timer for driver to user
  //   driverToUserTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (timeDriverToUser > 0) {
  //       timeDriverToUser--;
  //     } else {
  //       timer.cancel();
  //     }
  //     update(); // Update UI
  //   });
  // }

  // setTimerUserToHome() {
  //   // Timer for user to home
  //   Polylineset.clear();
  //   Polylineset = Get.arguments["polylinefromtouser"];

  //   userToHomeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (timeUserToHome > 0) {
  //       timeUserToHome--;
  //     } else {
  //       timer.cancel();
  //     }
  //     update(); // Update UI
  //   });
  // }