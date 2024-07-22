import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

class TravelController extends GetxController with RequiredDeatils {
  List isThereTravel = [];

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
    await Future.delayed(const Duration(seconds: 3));
    updataStatus(StatusRequest.success);
  }

  @override
  void goToFindDriver() {
    if (fromName.isEmpty ||
        toName.isEmpty ||
        selectedDate.isEmpty ||
        fare == 0) {
      Get.snackbar("Failure", "Please enter all fields",
          colorText: Colors.white);
    } else {
      Get.snackbar("Success", "You have saved a travel",
          colorText: Colors.white);
      Get.offAllNamed(AppRoute.travelview);
    }
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
  void checkIsAllSelected() {
    if (fromName != "" && toName != "" && allDate != "") {
      Get.offAllNamed(AppRoute.travelview);
    } else {
      Get.snackbar("Error", "Please enter all data", colorText: Colors.white);
    }
  }
}
