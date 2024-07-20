import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/core/function/polyline.dart';
import 'package:intl/intl.dart';

mixin RequiredDeatils {
  int numberPassengers1 = 0;
  int PrivteRidefare = 0;
  bool isPrivteRide = true;

  TextEditingController? commentController;
  TextEditingController? fareController;

  List<String> days = [];
  String selectedDate = '';
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

  void calcMinFare() {
    minfare =
        (distanceInKm * 5).toInt() + numberPassengers1 * 10 + PrivteRidefare;
    fare = minfare;
    PrintString("fare", fare);
  }

  void fareValidate() {
    if (fareController!.text.isNotEmpty) {
      int enteredFare = int.parse(fareController!.text);
      if (minfare <= enteredFare) {
        fare = enteredFare;
        fareController!.text = minfare.toString();
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

    for (int i = 0; i < 364; i++) {
      DateTime day = now.add(Duration(days: i));
      days.add(formatter.format(day));
    }
  }

  void goToChooseLocation(bool status);
  void goToFindDriver();
  void setFare();
}
