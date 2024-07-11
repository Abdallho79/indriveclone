// ignore_for_file: non_constant_identifier_names
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/services/services.dart';

class VerifyController extends GetxController {
  MyServices myservices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  String? phoneNumber;
  String? username;
  String? email;
  int? userid;

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  void onSubmit(String code) {
    if (code == "222222") {
      // sendCodeOTP(code, goToHomeView);
      goToHomeView();
    }
  }

  goToHomeView() async {
    myservices.sharedPreferences.setInt("id", userid!);
    myservices.sharedPreferences.setString("email", email!);
    myservices.sharedPreferences.setString("phonenumber", phoneNumber!);
    myservices.sharedPreferences.setString("username", username!);
    Get.offAllNamed(AppRoute.homeview);
  }

  @override
  void onInit() {
    username = Get.arguments["name"];
    email = Get.arguments["email"] ?? "You Don't enter any email";
    phoneNumber = Get.arguments["number"];
    userid = Get.arguments["id"];
    // phoneNumberSignUp(phoneNumber!);

    super.onInit();
  }
}

  

  // Future<void> addUserToFireBase() {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'user_name': user_name, // John Doe
  //         'user_email': email, // Stokes and Sons
  //         'user_phone': phoneNumber, // 42
  //         "user_location": {"loction_lat": 31.024054, "loction_long": 31.417328}
  //       })
  //       .then((value) {})
  //       .catchError((error) {
  //         Get.snackbar("Failure", "Failed to add user: $error",
  //             colorText: Colors.white);
  //       });
  // }