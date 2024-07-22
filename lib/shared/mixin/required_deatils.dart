import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:intl/intl.dart';

mixin RequiredDeatils {
  StatusRequest statusRequest = StatusRequest.none;
  int countDate = 1;
  String allDate = "";

  int numberPassengersShow = 1;
  int numberPassengersCounter = 1;

  int PrivteRidefare = 0;
  bool isPrivteRide = true;
  bool isClientFrom = false;

  TextEditingController? commentController;
  TextEditingController? fareController;

  List<String> days = [];

  String selectedDate = "";
  String selectedDateHour = "";
  String comment = "";

  int fare = 0;
  String recommendedFare = "Recommended :  ";
  int minfare = 80;

  double distanceInKm = 0;

  double? fromLat;
  double? fromLong;
  String fromName = "";
  double? toLat;
  double? toLong;
  String toName = "";

  Future<void> setLocationHomeMap({
    required double lat,
    required double long,
    required String name,
    required bool isFrom,
    bool? isFright = false,
  }) async {
    if (isFrom) {
      fromLat = lat;
      fromLong = long;
      fromName = name;
    } else {
      toLat = lat;
      toLong = long;
      toName = name;
    }
    if (isFright!) {
      if (fromLat != null && toLat != null) {
        await calcDistance();
        calcMinFareFrieght();
      }
    } else {
      if (fromLat != null && toLat != null) {
        await calcDistance();
        calcMinFareTravel();
      }
    }
  }

  Future<void> calcDistance() async {
    if (fromLat != null ||
        fromLong != null ||
        toLat != null ||
        toLong != null) {
      Map<String, dynamic>? data =
          await getPolyLine(fromLat!, fromLong!, toLat!, toLong!, "user_line");
      await Future.delayed(const Duration(seconds: 1));
      distanceInKm = data!["distance"];
      PrintString("distanceInKm", distanceInKm);
    }
  }

  void calcMinFareTravel() {

    minfare =
        (distanceInKm * 5).toInt() + numberPassengersShow * 5 + PrivteRidefare;
    fare = minfare;
    PrintString("fare", fare);
  }

  void calcMinFareFrieght() {
    minfare = (distanceInKm * 20).toInt() + PrivteRidefare;
    fare = minfare;
    PrintString("fare", fare);
  }

  void fareValidate() {
    if (fareController!.text.isNotEmpty) {
      int enteredFare = int.parse(fareController!.text);
      if (minfare <= enteredFare) {
        fare = enteredFare;
        recommendedFare = "";
        Get.back();
      } else {
        recommendedFare = "Recommended :  ";
        Get.snackbar("Error", "Fare can't be less than $minfare",
            colorText: Colors.white);
      }
    } else {
      recommendedFare = "Recommended :  ";
      Get.back();
    }
  }

  void setComment(String text) {
    comment = text;
  }

  void generateDays() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEE, d MMM');

    for (int i = 0; i < 30; i++) {
      DateTime day = now.add(Duration(days: i));
      days.add(formatter.format(day));
    }
  }

  void SelectDate(String date) {
    selectedDate = date;
  }

  void SelectHour(String date) {}

  void goToChooseLocation(bool status);
  void goToFindDriver();
  void setFare();
  void setAllDate(String date) {}
  void incrementPassengers() {}
  void decrementPassengers() {}
  void selectPassengers(int numberOfPassengers) {}
  void checkIsAllSelected();
  // void setSelectDate(String date);
  List<String> hours = [
    "00 : 00",
    "00 : 30",
    "01 : 00",
    "01 : 30",
    "02 : 00",
    "02 : 30",
    "03 : 00",
    "03 : 30",
    "04 : 00",
    "04 : 30",
    "05 : 00",
    "05 : 30",
    "06 : 00",
    "06 : 30",
    "07 : 00",
    "07 : 30",
    "08 : 00",
    "08 : 30",
    "09 : 00",
    "09 : 30",
    "10 : 00",
    "10 : 30",
    "11 : 00",
    "11 : 30",
    "12 : 00",
    "12 : 30",
    "13 : 00",
    "13 : 30",
    "14 : 00",
    "14 : 30",
    "15 : 00",
    "15 : 30",
    "16 : 00",
    "16 : 30",
    "17 : 00",
    "17 : 30",
    "18 : 00",
    "18 : 30",
    "19 : 00",
    "19 : 30",
    "20 : 00",
    "20 : 30",
    "21 : 00",
    "21 : 30",
    "22 : 00",
    "22 : 30",
    "23 : 00",
    "23 : 30"
  ];
}
