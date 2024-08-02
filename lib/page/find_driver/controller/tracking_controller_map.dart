// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/find_driver/controller/tracking_controller.dart';
import 'package:indriveclone/shared/mixin/google_map_services_controller.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';

class TrackingMapController extends GetxController with CoustomGoogleMapMixIn {
  Set<Polyline> Polylineset = {};
  Set<Polyline> PolylinesetUserToHome = {};
  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];
  String message = "Is driver has arrived?";
  bool isDriverArrive = false;
  DriverModel? selectedDriverData;
  MyServices myServices = Get.find();
  bool? isUserExitApp;

  double? userFromLat;
  double? userFromLong;
  double? userToLat;
  double? userToLong;
  double? distace;
  double? distaceUserToHome;

  Timer? driverToUserTimer;

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
          title: selectedDriverData!.driverName,
          snippet: "${selectedDriverData!.driverCarModel}",
        ),
        markerId: const MarkerId("driver"),
        position: LatLng(selectedDriverData!.driverLatitude!,
            selectedDriverData!.driverLongitude!)));
  }

  void driverReachUser() {
    if (isDriverArrive) {
      userReachDest();
    } else {
      try {
        isDriverArrive = true;
        Get.find<TrackingController>().driverToUserTimer!.cancel();
        Polylineset.clear();
        markers.removeWhere((element) => element.markerId.value == "userfrom");
        Get.find<TrackingController>().startTrackingUserLocation();
        message = "Have You arive to your home";
        Polylineset = PolylinesetUserToHome;
        update();
      } catch (e) {
        Get.snackbar("error", e.toString());
      }
    }
  }

  void userReachDest() {
    Get.snackbar("Welcome", "Hiiiiii");
    myServices.sharedPreferences.setBool("isUserInTrackingMood", false);
    Get.offAllNamed(AppRoute.homeview);
  }

  updatePolyLine(
    double latStart,
    double longStart,
    double latDest,
    double longDest,
    String poly_id,
  ) async {
    Map? data =
        await getPolyLine(latStart, longStart, latDest, longDest, poly_id);
    await Future.delayed(const Duration(seconds: 1));
    if (data!.containsKey('polylines')) {
      Polylineset.clear();
      Polylineset = data["polylines"];
    } else {
      Get.snackbar("Error", "Please Choose again");
    }
    update();
  }

  void updateMarkerAndMoveCamera(
      double lat, double long, String markerId) async {
    markers.removeWhere((element) => element.markerId.value == markerId);
    setCoustomIconn(3);
    markers.add(Marker(
      icon: BitmapDescriptor.fromBytes(customMarker),
      markerId: MarkerId(markerId),
      position: LatLng(lat, long),
    ));
    await Future.delayed(const Duration(seconds: 1));
    if (googleMapController != null) {
      googleMapController!.animateCamera(
        CameraUpdate.newLatLng(LatLng(lat, long)),
      );
    }
    update();
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["isUserExitApp"] == null) {
        loadFromMemo();
      } else {
        // تحقق من أن القيم المطلوبة ليست null
        userToLat = Get.arguments["usertolat"] ??
            0.0; // استخدام قيمة افتراضية إذا كانت null
        userToLong = Get.arguments["usertolong"] ?? 0.0;
        userFromLat = Get.arguments["userfromlat"] ?? 0.0;
        userFromLong = Get.arguments["userfromlong"] ?? 0.0;

        selectedDriverData = Get.arguments["selectedDriverData"] ??
            DriverModel(); // استخدم قيمة افتراضية إذا كانت null

        distaceUserToHome = Get.arguments["distance"] ?? 0.0;
        PolylinesetUserToHome = Get.arguments["po"] ?? <Polyline>{};
      }
    } else {
      // التعامل مع حالة Get.arguments إذا كانت null
      loadFromMemo();
    }

    getCurrentLocation();
    addMarkers();
    initPolyLine();
    super.onInit();
  }

  void loadFromMemo() async {
    selectedDriverData = DriverModel(
        driverId: myServices.sharedPreferences.getInt("driverId"),
        driverLatitude: myServices.sharedPreferences.getDouble("driver_lat"),
        driverLongitude: myServices.sharedPreferences.getDouble("driver_long"));

    // استرجاع بيانات أخرى
    distaceUserToHome = myServices.sharedPreferences.getDouble("distance");
    userToLat = myServices.sharedPreferences.getDouble("usertolat");
    userToLong = myServices.sharedPreferences.getDouble("usertolong");
    userFromLat = myServices.sharedPreferences.getDouble("userfromlat");
    userFromLong = myServices.sharedPreferences.getDouble("userfromlong");

    Map? data1 = await getPolyLine(
        userFromLat!, userFromLong!, userToLat!, userToLong!, "user");

    await Future.delayed(const Duration(seconds: 1));
    if (data1 != null && data1.containsKey('polylines')) {
      PolylinesetUserToHome = data1["polylines"];
      changeStatusRequset(StatusRequest.success);
    } else {
      changeStatusRequset(StatusRequest.none);
    }
  }

  @override
  void onClose() {
    super.onClose();
    // تأكد من أن الديباجر ليس null قبل استدعاء الدالة dispose
    if (googleMapController != null) {
      googleMapController!.dispose();
    }

    // إلغاء أي مؤقتات تعمل
    if (driverToUserTimer != null && driverToUserTimer!.isActive) {
      driverToUserTimer!.cancel();
    }
  }

  void initPolyLine() async {
    changeStatusRequset(StatusRequest.loading);
    Map<String, dynamic>? data = await getPolyLine(
        selectedDriverData!.driverLatitude!,
        selectedDriverData!.driverLongitude!,
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

  @override
  void getCurrentLocation() {
    initialPosition = CameraPosition(
        target: LatLng(selectedDriverData!.driverLatitude!,
            selectedDriverData!.driverLongitude!),
        zoom: 14);
  }

  @override
  onMapCreated(GoogleMapController controller) {
    changeStatusRequset(StatusRequest.loading);
    googleMapController = controller;
    changeStatusRequset(StatusRequest.success);
    loadMapStyles();
  }
}
