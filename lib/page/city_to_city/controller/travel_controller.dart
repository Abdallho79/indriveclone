import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/city_to_city/data/local/find_driver_data.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

class TravelController extends GetxController with RequiredDeatils {
  Map data = {};
  FindDriverCityToCityData findDriverCityToCityData =
      FindDriverCityToCityData(Get.find());
  MyServices myServices = Get.find();

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  updataStatus(StatusRequest status) {
    statusRequest = status;
    update();
  }

  void changeRideStatus(bool status) {
    isPrivteRide = status;
    if (isPrivteRide) {
      super.PrivteRidefare = 100;
    } else {
      super.PrivteRidefare = 50;
    }
    calcMinFareTravel();
    update();
  }

  Future<void> findDriverTravel() async {
    if (fromLat != null && toLat != null) {
      int type = 0;
      if (isPrivteRide) {
        type = 1;
      }
      data = {
        "userid": myServices.sharedPreferences.getString("id").toString(),
        "userTime": "$selectedDateHour ,$allDate",
        "distance": distanceInKm.toString(),
        "cost": fare.toString(),
        "from_lat": fromLat.toString(),
        "from_long": fromLong.toString(),
        "from_name": fromName,
        "to_lat": toLat.toString(),
        "to_long": toLong.toString(),
        "to_name": toName,
        "number_of_passengers": numberPassengersCounter.toString(),
        "type": type.toString(),
        "comment": comment,
      };
      updataStatus(StatusRequest.loading);
      var response = await findDriverCityToCityData.findDriver(data);

      statusRequest = handlingStatusRequestData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "You have saved a travel",
              colorText: AppColor.setCoursorColor());
          Get.offAllNamed(AppRoute.travelview);
        } else {
          statusRequest = StatusRequest.nodatafailure;
        }
      }
      update();
    } else {
      Get.snackbar("Error", "Please enter all data",
          colorText: AppColor.setCoursorColor());
    }
  }

  @override
  void goToFindDriver() async {
    if (fromName.isEmpty ||
        toName.isEmpty ||
        selectedDate.isEmpty ||
        fare == 0) {
      Get.snackbar("Failure", "Please enter all fields",
          colorText: AppColor.setCoursorColor());
    } else {
      await findDriverTravel();
    }
  }

  @override
  void incrementPassengers() {
    if (numberPassengersCounter < 30) {
      numberPassengersCounter++;
    }
    update();
  }

  @override
  void decrementPassengers() {
    if (numberPassengersCounter > 1) {
      numberPassengersCounter--;
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
            isFrom: isClientFrom);
        if (fromLat != null && toLat != null) {
          addLoading();
        }
        update();
      }
    });
  }

  addLoading() async {
    updataStatus(StatusRequest.loading);
    await Future.delayed(const Duration(seconds: 2));
    updataStatus(StatusRequest.success);
  }

  @override
  void setComment(String text) {
    super.comment = text;
    update();
  }

  @override
  void setFare() {
    super.fareValidate();
    update();
  }

  @override
  void SelectDate(String date) {
    super.selectedDate = date;
    update();
  }

  @override
  void SelectHour(String date) {
    super.selectedDateHour = date;
    update();
  }

  @override
  void setAllDate(String date) {
    super.allDate = date;
    update();
  }

  @override
  void selectPassengers(int numberOfPassengers) {
    super.numberPassengersShow = numberOfPassengers;
    super.calcMinFareTravel();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    super.fareController = TextEditingController();
    super.commentController = TextEditingController();
    super.PrivteRidefare = 100;
    super.calcMinFareTravel();
  }

  @override
  void dispose() {
    super.fareController!.dispose();
    super.commentController!.dispose();
    super.dispose();
  }

  @override
  void checkIsAllSelected() {}
}
