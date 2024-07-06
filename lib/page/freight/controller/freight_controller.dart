import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FreightController extends GetxController {
  List<String> days = [];
  String selectedDate = '';
  int isNaal = 1;
  String choosencar = "(Rob3 Naa'l) (Dababa)";
  TextEditingController? fareController;
  TextEditingController? commentContrller;
  int fare = 0;
  String comment = "";
  int pickuptime = 1;
  //1 => 10-20 min
  //2 => up to 1 hour
  //3 => schedule
  List imagesList = [];
  // < Image

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      imagesList.add(File(pickedFile.path));
      update();
    }
  }

  removeImage(int index) {
    imagesList.removeAt(index);
    update();
  }

  updateImage(int index, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      imagesList[index] = File(pickedFile.path);
      update();
    }
  }

  // Image >
  // < Cat
  whichCar(int car, String carname) {
    isNaal = car;
    choosencar = carname;

    update();
  }
  //  Cat >

  // < PickUp Time
  changePickUpStatus(int status) {
    //1 => 10-20 min
    //2 => up to 1 hour
    //3 => schedule
    pickuptime = status;
    update();
  }
  //  PickUp Time >

  // < Fare >

  validate() {
    if (fareController!.text.isNotEmpty) {
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
  // Fare >

  // < Comment
  setComment(String text) {
    comment = text;
    update();
  }
  // Comment >

  // < Date
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
  //  Date >

  @override
  void onInit() {
    super.onInit();
    fareController = TextEditingController();
    commentContrller = TextEditingController();
    generateDays();
  }

  @override
  void dispose() {
    super.dispose();
    fareController!.dispose();
    commentContrller!.dispose();
  }
}
