import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/share_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/page/support/data/remote/update_profile_data.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';

class ChangeMobileNumberController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myservices = Get.find();
  TextEditingController? nameController;
  String? phoneNumber;
  String? oldPhoneNumber;
  bool isPhoneNumberTrue = false;
  UpdateProfileData updateProfileData = UpdateProfileData(Get.find());
  Map data = {};

  goToVerifyPage() async {
    if (phoneNumber ==
        myservices.sharedPreferences.getString(AppSharedpref.userPhoneNumber)) {
      Get.snackbar("failure", "You have enter the same phone number",
          colorText: AppColor.setCoursorColor());
      return;
    }
    if (isPhoneNumberTrue) {
      Get.toNamed(AppRoute.changephoneverifyview);
    } else {
      Get.snackbar("failure", "Enter correct number",
          colorText: AppColor.setCoursorColor());
    }
  }

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  updateUser() async {
    data = {
      "id": myservices.sharedPreferences.getString(AppSharedpref.userId),
      "email": myservices.sharedPreferences.getString(AppSharedpref.userEmail),
      "username":
          myservices.sharedPreferences.getString(AppSharedpref.userName),
      "old_photo":
          myservices.sharedPreferences.getString(AppSharedpref.photo),
      "phonenumber": phoneNumber,
    };
    statusRequest = StatusRequest.loading;
    update();
    var response = await updateProfileData.updateDate(data, null);
    statusRequest = handlingStatusRequestData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  void onSubmit(String code) {
    if (code == "222222") {
      // sendCodeOTP(code, goToHomeView);
      goToHomeView();
      Get.snackbar("Seccess", "The phone number has been change successfuly",
          colorText: AppColor.setTextColor());
    }
  }

  goToHomeView() async {
    updateUser();
    Get.find<MyDrawerController>().isActive = 1;
    myservices.sharedPreferences
        .setString(AppSharedpref.userPhoneNumber, phoneNumber!);
    Get.offAllNamed(AppRoute.homeview);
  }
}
