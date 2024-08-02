// ignore_for_file: deprecated_member_use, equal_keys_in_map

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_mab_controller.dart';
import 'package:indriveclone/page/find_driver/data/remote/add_travel_data.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';
import 'package:geolocator/geolocator.dart';

class FindDriverController extends GetxController {
  double? distance;
  double? time;
  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];
  List<DriverModel> drivers = [];
  AddTravelData addTravelData = AddTravelData(Get.find());
  MyServices myServices = Get.find();
  late DriverModel selectedDriverData;
  bool isUserExitApp = false;
  int? fare;
  double? fromLat;
  double? fromLong;
  String fromName = "";
  double? toLat;
  double? toLong;
  String toName = "";
  String? choosecar;

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  Future<void> saveTravel() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      Get.snackbar("Error", "Open location services to continue",
          colorText: AppColor.setCoursorColor());
      await Geolocator.requestPermission();
      return;
    }

    Map<String, dynamic> data = {
      'userid': myServices.sharedPreferences.getString("id").toString(),
      'driverid': selectedDriverData.driverId.toString(),
      'distance': distance.toString(),
      'cost': fare.toString(),
      'from_lat': fromLat.toString(),
      'from_long': fromLong.toString(),
      'from_name': fromName,
      'to_lat': toLat.toString(),
      'to_long': toLong.toString(),
      'to_name': toName,
      'choosecar': choosecar,
      "time": time.toString(),
    };

    changeStatusRequset(StatusRequest.loading);
    var response = await addTravelData.findDriver(data);
    statusRequest = handlingStatusRequestData(response);

    if (statusRequest != StatusRequest.success) {
      changeStatusRequset(statusRequest);
      return;
    }

    if (response['status'] != "success") {
      changeStatusRequset(statusRequest);
      return;
    }
    saveInMemo();
    Get.offAllNamed(AppRoute.trackingtohome, arguments: {
      "isUserExitApp": isUserExitApp,
      "selectedDriverData": selectedDriverData,
      "distance": distance,
      "timeusertohome": time,
      "fare": fare,
      "usertolat": toLat,
      "usertolong": toLong,
      "userfromlat": fromLat,
      "userfromlong": fromLong,
      "distance": distance,
      "po": Get.find<FindDriverMabController>().polylineSet,
    });
  }

  void saveInMemo() {
    // حفظ بيانات السائق
    myServices.sharedPreferences
        .setInt("driverId", selectedDriverData.driverId!);
    myServices.sharedPreferences
        .setString("driverName", selectedDriverData.driverName ?? '');
    myServices.sharedPreferences
        .setString("driverCar", selectedDriverData.driverCarModel ?? '');
    myServices.sharedPreferences
        .setString("driverPhone", selectedDriverData.driverPhoneNumber ?? '');
    myServices.sharedPreferences
        .setDouble("driver_lat", selectedDriverData.driverLatitude ?? 0.0);
    myServices.sharedPreferences
        .setDouble("driver_long", selectedDriverData.driverLongitude ?? 0.0);
    // حفظ بيانات أخرى
    myServices.sharedPreferences.setDouble("distance", distance ?? 0.0);
    myServices.sharedPreferences.setDouble("timeusertohome", time ?? 0);
    myServices.sharedPreferences.setInt("fare", fare ?? 0);
    myServices.sharedPreferences.setDouble("usertolat", toLat ?? 0.0);
    myServices.sharedPreferences.setDouble("usertolong", toLong ?? 0.0);
    myServices.sharedPreferences.setDouble("userfromlat", fromLat ?? 0.0);
    myServices.sharedPreferences.setDouble("userfromlong", fromLong ?? 0.0);

    // لتخزين polylineSet، يجب تحويله إلى صيغة قابلة للتخزين مثل JSON
    var polylineSetJson = "${Get.find<FindDriverMabController>().polylineSet}";
    myServices.sharedPreferences.setString("polylineSet", polylineSetJson);
  }

  void selectedDriver(int index) {
    selectedDriverData = drivers[index];
    goToTrackingView();
  }

  void goToTrackingView() async {
    if (time != null) {
      await saveTravel();
    }
  }

  @override
  void onInit() {
    super.onInit();
    PrintString("Get.Argumets", Get.arguments);
    fare = Get.arguments["fare"];
    toLat = Get.arguments["tolat"];
    toLong = Get.arguments["tolong"];
    fromLat = Get.arguments["fromlat"];
    fromLong = Get.arguments["fromlong"];
    fromName = Get.arguments["fromName"];
    choosecar = Get.arguments["choosecar"];
    time = Get.arguments["time"];
    distance = Get.arguments["distance"];
    toName = Get.arguments["toName"];
    drivers = Get.arguments["data"];
  }

  void changeStatusRequset(StatusRequest status) {
    statusRequest = status;
    update();
  }
}
