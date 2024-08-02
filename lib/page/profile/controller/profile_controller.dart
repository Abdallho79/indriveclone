import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/constant/share_app.dart';
import 'package:indriveclone/core/function/check_internet.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/core/function/google_signin.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/support/data/remote/update_profile_data.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';

class ProfileController extends GetxController {
  final UpdateProfileData updateProfileData = UpdateProfileData(Get.find());
  final MyServices myservices = Get.find();
  Map data = {};
  StatusRequest statusRequest = StatusRequest.none;

  late String userId;

  late String oldName;
  late String oldEmail;
  String oldPhotoPath = "";

  late String newName;
  late String newEmail;
  String newPhotoPath = "";

  late TextEditingController nameController;
  late TextEditingController emailController;

  File? file;

  void goToBack() {
    Get.find<MyDrawerController>().isActive = 1;
    Get.offAllNamed(AppRoute.homeview);
  }

  Future<void> isThereInternet() async {
    if (await checkInternet()) {
      statusRequest = StatusRequest.none;
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();

    oldName =
        myservices.sharedPreferences.getString(AppSharedpref.userName) ?? "";
    oldEmail =
        myservices.sharedPreferences.getString(AppSharedpref.userEmail) ?? "";
    userId = myservices.sharedPreferences.getString(AppSharedpref.userId) ?? "";
    oldPhotoPath =
        myservices.sharedPreferences.getString(AppSharedpref.photo) ?? "";

    nameController.text = oldName;
    emailController.text = oldEmail;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      newPhotoPath = file!.path;
      update();
    }
  }

  Future<void> logInWithGoogle() async {
    statusRequest = StatusRequest.loading;
    update();
    final Map? userData = await signInWithGoogle();
    if (userData != null) {
      emailController.text = userData["email"] ?? oldEmail;
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  Future<void> updateUser() async {
    data = {
      "id": userId,
      "email": newEmail,
      "username": newName,
      "old_photo": oldPhotoPath,
      "phonenumber": myservices.sharedPreferences
              .getString(AppSharedpref.userPhoneNumber) ??
          "",
    };

    statusRequest = StatusRequest.loading;
    update();

    final response = await updateProfileData.updateDate(data, file);
    PrintString("1", "1");
    statusRequest = handlingStatusRequestData(response);
    PrintString("21", "12");
    if (statusRequest == StatusRequest.success) {
      update();
    }
    if (response['status'] == "success") {
      Map datauser = response["data"];
      nameController.text = datauser["users_name"];
      _saveToPreferences(
        datauser["users_name"],
        datauser["users_google"],
        datauser["users_photo"],
      );
    } else {
      statusRequest = StatusRequest.none;
      update();
      Get.snackbar("Error", "Failed to update profile",
          colorText: AppColor.setWhiteAndBlack());
    }
  }

  void _saveToPreferences(String name, String email, String photo) {
    myservices.sharedPreferences.setString(AppSharedpref.userName, name);
    myservices.sharedPreferences.setString(AppSharedpref.userEmail, email);
    myservices.sharedPreferences.setString(AppSharedpref.photo, photo);
    oldPhotoPath = photo;
    newPhotoPath = "";
    Get.find<MyDrawerController>().updateData(newName, photo);
  }

  void saveData() {
    newName = nameController.text;
    newEmail = emailController.text;
    PrintString("newName", newName != oldName);
    PrintString("newEmail", newEmail != oldEmail);
    PrintString("newPhoto", newPhotoPath != "");
    if (newName != oldName || newEmail != oldEmail || newPhotoPath != "") {
      updateUser();
    } else {
      Get.snackbar("Error", "You can't save without making any changes",
          colorText: AppColor.setWhiteAndBlack());
    }
  }
}
