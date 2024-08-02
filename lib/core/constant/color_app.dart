import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/services/services.dart';

class AppColor {
  static MyServices myServices = Get.find();
  static String theme =
      myServices.sharedPreferences.getString("theme") ?? "light";

  // تحديث theme في AppColor
  static void updateTheme(String newTheme) {
    theme = newTheme;
  }

  static const Color green = Color(0xff8EC40C);

  static Color setCoursorColor() {
    return theme != "dark"
        ? const Color.fromRGBO(0, 0, 0, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
  }

  static Color setTextColor() {
    return theme != "dark"
        ? const Color.fromRGBO(63, 71, 82, 1)
        : const Color.fromRGBO(219, 212, 212, 1);
  }

  static Color setBackGrounColor() {
    return theme == "dark" ? const Color(0xff1C1F24) : const Color(0xffFFFFFF);
  }

  static Color setIsActiveLightColor() {
    return theme == "dark"
        ? const Color.fromRGBO(63, 71, 82, 1)
        : const Color.fromARGB(255, 210, 216, 224);
  }

  static Color setWhiteAndBlack() {
    return theme == "dark" ? const Color(0xffFFFFFF) : const Color(0xff000000);
  }
}
