import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/auth/data/remote/login.dart';

class ConfrimController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  String? phoneNumber;
  int? id;
  Map userData = {};
  bool isNumberTrue = false;
  GoogleSignIn googleSignIn = GoogleSignIn();
  String? selectedphoto;
  File? file;

  isTherePhoto() {
    if (file != null) {
      selectedphoto = file!.path;
      update();
    }
  }

  addUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.insertDataGoogle(
        phoneNumber!, nameController!.text, emailController!.text, file);
    statusRequest = handlingStatusRequestData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        emailController!.text = response["data"]["users_google"];
        id = response["data"]["users_id"];
        MyPrint([id, emailController]);
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  goToVerifyPage() async {
    if (isNumberTrue) {
      if (formstate.currentState!.validate()) {
        await addUser();
        Get.toNamed(AppRoute.verifyview, arguments: {
          "isgoogle": true,
          "number": phoneNumber,
          "name": nameController!.text,
          "email": emailController!.text,
          "id" : id
        });
      }
    } else {
      Get.snackbar("failure", "Enter corect number", colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    userData = Get.arguments["data"];
    nameController!.text = userData["name"];
    emailController!.text = userData["email"];
    selectedphoto = userData["photoUrl"];
    super.onInit();
  }

  @override
  void dispose() {
    nameController!.dispose();
    emailController!.dispose();
    phoneController!.dispose();
    super.dispose();
  }
}
