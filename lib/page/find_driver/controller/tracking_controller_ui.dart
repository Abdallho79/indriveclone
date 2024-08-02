// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/home/data/model/driver_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackingUIController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  bool? isUserExitApp;
  late DriverModel selectedDriverData;

  int? fare;

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  changeStatusRequset(StatusRequest status) {
    statusRequest = status;
    update();
  }

  Future<void> openWhatsApp() async {
    String phoneNumber = selectedDriverData.driverPhoneNumber!;
    String message = "Hello, I would like to contact you regarding my fare.";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar("Error", "Could not launch WhatsApp");
    }
  }

  @override
  void onInit() {
    myServices.sharedPreferences.setBool("isUserInTrackingMood", true);
    if (Get.arguments != null) {
      if (Get.arguments["isUserExitApp"] != null) {
        selectedDriverData = DriverModel(
            driverName: myServices.sharedPreferences.getString("driverName"),
            driverCarModel: myServices.sharedPreferences.getString("driverCar"),
            driverPhoneNumber:
                myServices.sharedPreferences.getString("driverPhone"));
        fare = myServices.sharedPreferences.getInt("fare");
      } else {
        fare = Get.arguments["fare"];
        selectedDriverData = Get.arguments["selectedDriverData"];
      }
    } else {
      fare = myServices.sharedPreferences.getInt("fare");
      selectedDriverData = DriverModel(
          driverName: myServices.sharedPreferences.getString("driverName"),
          driverCarModel: myServices.sharedPreferences.getString("driverCar"),
          driverPhoneNumber:
              myServices.sharedPreferences.getString("driverPhone"));
    }

    super.onInit();
  }
}














