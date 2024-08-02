import 'package:flutter/material.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/profile/controller/profile_controller.dart';

Padding buildSaveButton(ProfileController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: () {
        controller.saveData();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColor.green,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: const MyCoustomText(
        text: "Save",
        weight: FontWeight.bold,
        size: 20,
        textAlign: null,
      ),
    ),
  );
}
