import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/phone_signup.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifyController extends GetxController {
  MyServices myServices = MyServices();
  static const int initialRemainingSeconds = 60;
  bool whatsapp = true;
  bool resendCodeEnabled = false;
  int remainingSeconds = initialRemainingSeconds;
  late Timer timer;
  String? user_id;
  String? phoneNumber;
  String? user_name;
  String? email;
  Map userData = {};
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void openWhatsApp() async {
    var whatsappUrl = "whatsapp://send?phone=+2001096366301";
    print("========================openmetthod=====================");

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
      print("========================openWhatsApp=====================");
    } else {
      print("========================can'tWhatsApp=====================");

      throw 'Could not launch $whatsappUrl';
    }
  }

  void onSubmit(String code) {
    sendCodeOTP(code, goToHomeView);
  }

  void reSendCode() {
    resendCodeEnabled = false;
    remainingSeconds = initialRemainingSeconds;
    phoneNumberSignUp(phoneNumber!);
    startTimer();
    update();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (remainingSeconds > 1) {
        remainingSeconds--;
        update();
      } else {
        remainingSeconds = 0;
        resendCodeEnabled = true;
        timer.cancel();
        update();
      }
    });
  }

  void goToHomeView() {
    Get.offAllNamed(AppRoute.homeview);
    addUserToFireBase();
  }

  Future<void> addUserToFireBase() {
    // Call the user's CollectionReference to add a new user
    return users.add({
      'user_name': user_name, // John Doe
      'user_email': email, // Stokes and Sons
      'user_phone': phoneNumber, // 42
      "user_location": {"loction_lat": 31.024054, "loction_long": 31.417328}
    }).then((value) {
      myServices.sharedPreferences.setString("user_id", user_id!);
      myServices.sharedPreferences.setString("email", email!);
      myServices.sharedPreferences.setString("phone_number", phoneNumber!);
      myServices.sharedPreferences.setString("user_name", user_name!);
    }).catchError((error) {
      Get.snackbar("Failure", "Failed to add user: $error",
          colorText: Colors.white);
    });
  }

  @override
  void onInit() {
    startTimer();

    userData = Get.arguments["data"];
    user_id = userData["uid"];
    user_name = userData["name"];
    email = userData["email"];
    phoneNumber = userData["number"];
    phoneNumberSignUp(phoneNumber!);

    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
