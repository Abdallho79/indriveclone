import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';
import 'package:indriveclone/page/home/controller/map_home_controller.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';
import 'package:indriveclone/page/home/data/remote/find_driver_data.dart';

class HomeController extends GetxController with RequiredDeatils {
  MyServices myServices = Get.find();
  FindDriverData findDriverData = FindDriverData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<DriverModel> data = [];
  double distance = 0;
  double time = 0;
  bool? isClientFrom;
  bool isAllSelected = false;
  MapHomeController mapController = Get.find();

  void _statusMethod(StatusRequest status) {
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

  Future<void> findDriver() async {
    data.clear();
    _statusMethod(StatusRequest.loading);
    var response = await findDriverData.findDriver(fromLat!, fromLong!);
    statusRequest = handlingStatusRequestData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => DriverModel.fromJson(e)));
        goToFindDriver();
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void goToChooseLocation(bool status) {
    isClientFrom = status;
    Get.toNamed(AppRoute.map, arguments: {"isClientFrom": isClientFrom})
        ?.then((value) {
      if (value != null) {
        setLocationHomeMap(
            lat: value["lat"],
            long: value["long"],
            name: value["name"] ?? "doesn't named",
            isFrom: isClientFrom!);
        mapController.addMarkers(value["lat"], value["long"], isClientFrom!);
        setIsAllSelected();
        update();
      }
    });
  }

  @override
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

  void setIsAllSelected() async {
    if (fromLong != null && toLong != null) {
      _statusMethod(StatusRequest.loading);
      Map data = await mapController.drawPolyline(
          fromLat!, fromLong!, toLat!, toLong!);
      distance = data["distance"];
      time = data["duration"];
      isAllSelected = true;
      await calcDistance();
      calcMinFare();
      _statusMethod(StatusRequest.success);
    } else {
      isAllSelected = false;
    }
  }

  @override
  void setFare() {
    fareValidate();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fareController = TextEditingController();
  }

  @override
  void dispose() {
    fareController!.dispose();
    super.dispose();
  }
}
