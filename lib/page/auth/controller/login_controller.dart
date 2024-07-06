import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/services/services.dart';

class LoginController extends GetxController {
  MyServices myservices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? nameController;
  bool onboarding = true;
  late Timer timer;
  String? phoneNumber;
  String? phoneKey;
  bool isPhoneNumberTrue = false;
  bool isGoogleLogin = false; // 1 => google  , false => none
  Map? _userData = {};

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
      update();
    } else {
      statusRequest = StatusRequest.offlinefailure;
      update(); // تحديث الحالة لإعادة بناء الواجهة
    }
  }

  isLoadingStatusRequest() {
    statusRequest = StatusRequest.loading;
    update();
  }

  doneLoadingStatusRequest() {
    statusRequest = StatusRequest.success;
    update();
  }

  setUserData(Map? data) {
    _userData = data;
    goToConfirmData();
  }

  goToConfirmData() {
    Get.toNamed(AppRoute.confrimview, arguments: {
      "data": _userData,
      "isgoogle": isGoogleLogin,
    });
  }

  void startTimer() async {
    await Future.delayed(const Duration(milliseconds: 0)); // تأخير لمدة 1.5 ثانية
    onboarding = false;
    update(); // إعادة رسم الواجهة بعد تغيير القيمة
  }

  goToVerifyPage() {
    if (isPhoneNumberTrue) {
      if (formstate.currentState!.validate()) {
        Get.toNamed(AppRoute.verifyview, arguments: {
          "isgoogle": isGoogleLogin,
          "number": phoneNumber,
          "name": nameController!.text,
          "email": ""
        });
      }
    } else {
      Get.snackbar("failure", "Enter correct number", colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    startTimer();
    isThereInternet();
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController!.dispose();
    super.dispose();
  }
}
