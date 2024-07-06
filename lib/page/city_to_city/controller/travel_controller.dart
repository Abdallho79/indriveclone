import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TravelController extends GetxController {
  List<String> days = [];
  String selectedDate = '';
  int numberPassengers = 1;
  int numberPassengers1 = 0;
  TextEditingController? fareController;
  TextEditingController? commentContrller;
  int fare = 0;
  String comment = "";
  bool isPrivteRide = true;

  changeRideStatus(bool status) {
    isPrivteRide = status;
    update();
  }

  setComment(String text) {
    comment = text;
    update();
  }

  validate() {
    if (!fareController!.text.isEmpty) {
      print("==============${fareController!.text}=================");
      if (80 <= int.parse(fareController!.text)) {
        fare = int.parse(fareController!.text);
        Get.back();
        update();
      } else {
        fare = 0;
        update();
        Get.snackbar("Erroe", "Fare Cant't be less than 80");
      }
    } else {
      fare = 0;
      Get.back();
      update();
    }
  }

  inCeremnt() {
    if (numberPassengers < 30) {
      numberPassengers++;
      update();
    }
  }

  deCeremnt() {
    if (numberPassengers > 1) {
      numberPassengers--;
      update();
    }
  }

  selectPassengers(int number) {
    numberPassengers1 = number;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fareController = TextEditingController();
    commentContrller = TextEditingController();
    generateDays();
  }

  void generateDays() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEE, d MMM');

    for (int i = 0; i < 364; i++) {
      DateTime day = now.add(Duration(days: i));
      days.add(formatter.format(day));
    }
    update();
  }

  void selectDate(String date) {
    selectedDate = date;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fareController!.dispose();
    commentContrller!.dispose();
  }
}
