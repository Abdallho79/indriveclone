import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/freight/data/local/find_driver_data.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

class FreightController extends GetxController with RequiredDeatils {
  int isNaal = 1;
  late String deliveryid;
  String choosencar = "(Rob3 Naa'l) (Dababa)";
  int pickuptime = 1;
  String setDate = "10-20 min";
  MyServices myServices = Get.find();
  FindDriverFrieghtData findDriverFrieghtData =
      FindDriverFrieghtData(Get.find());
  Map data = {};
  //1 => 10-20 min
  //2 => up to 1 hour
  //3 => schedule
  List<File> imagesList = [];
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

  @override
  void checkIsAllSelected() {
    if (fromName != "" &&
        toName != "" &&
        setDate != "" &&
        imagesList.isNotEmpty) {
      goToFindDriver();
    } else {
      Get.snackbar("Error", "Please enter all data",
          colorText: AppColor.setCoursorColor());
    }
  }

  @override
  void goToFindDriver() async {
    data = {
      "userid": myServices.sharedPreferences.getString("id").toString(),
      "distance": distanceInKm.toString(),
      "cost": fare.toString(),
      "from_lat": fromLat.toString(),
      "from_long": fromLong.toString(),
      "from_name": fromName,
      "to_lat": toLat.toString(),
      "to_long": toLong.toString(),
      "to_name": toName,
      "type": isNaal.toString(),
      "delivery_userTIme": setDate,
      "delivery_comment": comment,
    };

    updataStatus(StatusRequest.loading);
    var response = await findDriverFrieghtData.findDriver(data);

    statusRequest = handlingStatusRequestData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        deliveryid = response["data"].toString();
        sendImages();
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  Future<void> sendImages() async {
    updataStatus(StatusRequest.loading);
    var response =
        await findDriverFrieghtData.sendImages(deliveryid, imagesList);

    statusRequest = handlingStatusRequestData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("Success", "Your order has sent to server",
            colorText: AppColor.setCoursorColor());

        Get.offAllNamed(AppRoute.frieghtview);
      }
    }
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
    if (status == 1) {
      setDate = "10-20 min";
    } else if (status == 2) {
      setDate = "Up to 1 hour";
    } else {
      setDate = "$selectedDateHour ,$allDate";
    }
    PrintString("SetDate", setDate);
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
