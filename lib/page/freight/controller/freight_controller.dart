import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

class FreightController extends GetxController with RequiredDeatils {
  int isNaal = 1;
  String choosencar = "(Rob3 Naa'l) (Dababa)";
  int pickuptime = 1;
  //1 => 10-20 min
  //2 => up to 1 hour
  //3 => schedule
  List imagesList = [];
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

  whichCar(int car, String carname) {
    isNaal = car;
    choosencar = carname;
    if (isNaal == 1) {
      super.PrivteRidefare = 400;
    } else {
      super.PrivteRidefare = 100;
    }
    calcMinFareFrieght();
    update();
  }

  changePickUpStatus(int status) {
    //1 => 10-20 min
    //2 => up to 1 hour
    //3 => schedule
    pickuptime = status;
    update();
  }

  @override
  void setFare() {
    fareValidate();
    update();
  }

  @override
  setComment(String text) {
    comment = text;
    update();
  }

  @override
  void SelectDate(String date) {
    selectedDate = date;
    update();
  }

  @override
  void SelectHour(String date) {
    selectedDateHour = date;
    update();
  }

  @override
  void setAllDate(String date) {
    allDate = date;
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
            isFrom: isClientFrom,
            isFright: true);
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
      Get.offAllNamed(AppRoute.frieghtview);
    }
  }

  @override
  void checkIsAllSelected() {
    if (fromName != "" &&
        toName != "" &&
        allDate != "" &&
        imagesList.isNotEmpty) {
      Get.offAllNamed(AppRoute.frieghtview);
    } else {
      Get.snackbar("Error", "Please enter all data", colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fareController = TextEditingController();
    commentController = TextEditingController();
    super.PrivteRidefare = 400;
    super.calcMinFareFrieght();
  }

  @override
  void dispose() {
    super.dispose();
    fareController!.dispose();
    commentController!.dispose();
  }
}
