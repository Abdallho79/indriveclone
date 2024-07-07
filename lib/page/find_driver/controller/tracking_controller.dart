import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:indriveclone/core/services/services.dart';

class TrackingController extends GetxController {
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(31.024054, 31.417328), zoom: 14.45);
  String? darkMapStyle;
  Completer<GoogleMapController>? googleMapController;
  Set<Polyline> Polylineset = {};
  MyServices myServices = Get.find();

  List<Marker> markers = [];

  bool isDriverArrive = false;

  int? fare;
  double? userFromLat;
  double? userFromLong;
  double? userToLat;
  double? userToLong;
  double? driverFromLat;
  double? driverFromLong;
  double? distaceUserToHome;
  double? distaceDriverToUser;
  int timeUserToHome = 3;
  int timeDriverToUser = 3;

  late Timer driverToUserTimer;
  late Timer userToHomeTimer;

  void onMapCreated(GoogleMapController controller) {
    if (!googleMapController!.isCompleted) {
      googleMapController!.complete(controller);
      controller.getZoomLevel();
    }
  }

  void addMarkers() {
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId("userfrom"),
        position: LatLng(userFromLat!, userFromLong!)));

    markers.add(Marker(
        markerId: const MarkerId("userto"),
        position: LatLng(userToLat!, userToLong!)));
    markers.add(Marker(
        markerId: const MarkerId("driver"),
        position: LatLng(driverFromLat!, driverFromLong!)));
  }

  // تحميل أسلوب الخريطة المظلم
  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    final controller = await googleMapController!.future;
    // ignore: deprecated_member_use
    controller.setMapStyle(darkMapStyle);
  }

  initPolyLine() async {
    // الحصول على خط متعدد الألوان الأول
    Map<String, dynamic>? data = await getPolyLine(driverFromLat!,
        driverFromLong!, userFromLat!, userFromLong!, "driver_line");
    await Future.delayed(const Duration(seconds: 1));
    if (data != null && data.containsKey('polylines')) {
      Polylineset = data["polylines"];
      distaceDriverToUser = data["distance"];
      timeDriverToUser = (data["duration"] * 6).toInt();

      update();
    }
  }

  @override
  void onInit() async {
    googleMapController = Completer<GoogleMapController>();
    myServices.sharedPreferences.setBool("isUserInTrackingMood", true);
    fare = Get.arguments["fare"];
    userToLat = Get.arguments["usertolat"];
    userToLong = Get.arguments["usertolong"];
    userFromLat = Get.arguments["userfromlat"];
    userFromLong = Get.arguments["userfromlong"];
    driverFromLong = Get.arguments["driverfromlong"];
    driverFromLat = Get.arguments["driverfromlat"];
    distaceUserToHome = Get.arguments["distanceusertohome"];
    timeUserToHome = (Get.arguments["timeusertohome"] * 6).toInt();

    super.onInit();

    addMarkers();
    _loadMapStyles();
    initPolyLine();
    await Future.delayed(const Duration(seconds: 2));
    setTimerDriverToUser();
  }

  driverNotArriveYet(bool driver_status) {
    isDriverArrive = driver_status;

    if (driver_status) {
      setTimerUserToHome();
    } else {
      timeDriverToUser = 6;
      setTimerDriverToUser();
    }

    update();
  }

  String formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;

    return '$hours/$minutes/$secs';
  }

  setTimerDriverToUser() {
    // Timer for driver to user
    driverToUserTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeDriverToUser > 0) {
        timeDriverToUser--;
      } else {
        timer.cancel();
      }
      update(); // Update UI
    });
  }

  setTimerUserToHome() {
    // Timer for user to home
    Polylineset.clear();
    Polylineset = Get.arguments["polylinefromtouser"];

    userToHomeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeUserToHome > 0) {
        timeUserToHome--;
      } else {
        timer.cancel();
      }
      update(); // Update UI
    });
  }

  @override
  void onClose() {
    driverToUserTimer.cancel();
    userToHomeTimer.cancel();
    super.onClose();
  }
}
