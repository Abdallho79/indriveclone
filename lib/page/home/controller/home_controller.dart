import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/mixin/required_deatils.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';
import 'package:indriveclone/page/home/data/remote/find_driver_data.dart';

class HomeController extends GetxController with RequiredDeatilsMixIn {
  MyServices myServices = Get.find();
  FindDriverData findDriverData = FindDriverData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<DriverModel> data = [];
  // Variables to store fare information
  double distance = 0;
  double time = 0;
  bool? isClientFrom;

  bool isAllSelected = false;

  findDriver() async {
    _statusMethod(StatusRequest.loading);
    var response = await findDriverData.findDriver(fromLat!, fromLong!);
    statusRequest = handlingStatusRequestData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        print("=======================");
        print(responsedata);
        print("=======================");
        data.addAll(responsedata.map((e) => DriverModel.fromJson(e)));
        goToFindDriver();
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  _statusMethod(StatusRequest status) {
    statusRequest = status;
    update();
  }

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  // Navigate to the location selection screen and update the location in HomeController
  void goToChooseLocation(bool status) {
    isClientFrom = status;
    Get.toNamed(AppRoute.map, arguments: {"isClientFrom": isClientFrom})
        ?.then((value) {
      if (value != null) {
        setLocation(
            lat: value["lat"],
            long: value["long"],
            name: value["name"] ?? "doesn't named",
            isFrom: isClientFrom!);
        setIsAllSelected();
        update();
      }
    });
  }

  // Navigate to the find driver screen with the necessary arguments
  void goToFindDriver() {
    if (fromLong != null && toLong != null) {
      Get.toNamed(AppRoute.finddriver, arguments: {
        "fromlat": fromLat,
        "fromlong": fromLong,
        "tolat": toLat,
        "tolong": toLong,
        "fare": fare,
        "data": data,
      });
    } else {
      Get.snackbar("Error", "Choose From & To", colorText: Colors.white);
    }
  }

  // Check if both "from" and "to" locations are selected
  void setIsAllSelected() async {
    if (fromLong != null && toLong != null) {
      _statusMethod(StatusRequest.loading);
      Map data = await mapController.drawPolyline(
          fromLat!, fromLong!, toLat!, toLong!);
      distance = data["distance"];
      time = data["duration"];
      fare = (distance * 5).toInt() <= 20 ? 20 : (distance * 5).toInt();
      isAllSelected = true;
      _statusMethod(StatusRequest.success);
    } else {
      isAllSelected = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fareController = TextEditingController();
    // Set initial values in shared preferences
  }

  @override
  void dispose() {
    fareController!.dispose();
    super.dispose();
  }
}
