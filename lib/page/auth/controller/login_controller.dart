import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/function/google_signin.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/auth/data/remote/login.dart';

class LoginController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myservices = Get.find();
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController? nameController;

  String? email;
  String? phoneNumber;
  int? id;

  bool isPhoneNumberTrue = false;

  Map? _userData = {};

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  addUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await loginData.insertData(phoneNumber!, nameController!.text);
    statusRequest = handlingStatusRequestData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        email = response["data"]["users_google"];
        id = response["data"]["users_id"];
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  goToVerifyPage() async {
    if (isPhoneNumberTrue) {
      if (formstate.currentState!.validate()) {
        await addUser();
        Get.toNamed(AppRoute.verifyview, arguments: {
          "number": phoneNumber,
          "name": nameController!.text,
          "email": email,
          "id": id,
        });
      }
    } else {
      Get.snackbar("failure", "Enter correct number", colorText: Colors.white);
    }
  }

  // close all exceptions

  logInWithGoogle() async {
    statusRequest = StatusRequest.loading;
    update();
    Map? userData = await signInWithGoogle();
    if (userData != null) {
      setUserData(userData);
      statusRequest = StatusRequest.success;
      update();
    }
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
    });
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController!.dispose();
    super.dispose();
  }
}
