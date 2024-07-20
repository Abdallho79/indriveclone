import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

class TravelController extends GetxController with RequiredDeatils {
  int numberPassengers = 1;
  List isThereTravel = [];

  bool isClientFrom = false;

  void changeRideStatus(bool status) {
    isPrivteRide = status;
    if (isPrivteRide) {
      super.PrivteRidefare = 100;
    } else {
      super.PrivteRidefare = 50;
    }
    calcMinFare();
    update();
  }

  @override
  void setComment(String text) {
    comment = text;
    update();
  }

  @override
  void setFare() {
    fareValidate();
    update();
  }

  void setGenerateDays() {
    generateDays();
    update();
  }

  void incrementPassengers() {
    if (numberPassengers < 30) {
      numberPassengers++;
    }
    update();
  }

  void decrementPassengers() {
    if (numberPassengers > 1) {
      numberPassengers--;
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
        update();
      }
    });
  }

  void selectDate(String date) {
    selectedDate = date;
    update();
  }

  void selectPassengers(int number) {
    numberPassengers1 = number;
    calcMinFare();
    update();
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
  void onInit() {
    super.onInit();
    fareController = TextEditingController();
    commentController = TextEditingController();
      super.PrivteRidefare = 100;
    setGenerateDays();
    calcMinFare();
  }

  @override
  void dispose() {
    fareController!.dispose();
    commentController!.dispose();
    super.dispose();
  }
}
