import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/services/services.dart';

class ConfrimController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  String? phoneNumber;
  Map userData = {};
  bool isNumberTrue = false;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> logOutGoogle() async {
    await googleSignIn.disconnect();
    Get.back();
  }

  goToVerifyPage() {
    if (isNumberTrue) {
      if (formstate.currentState!.validate()) {
        Get.toNamed(AppRoute.verifyview, arguments: {
          "isgoogle": true,
          "number": phoneNumber,
          "name": nameController!.text,
          "email": emailController!.text
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
