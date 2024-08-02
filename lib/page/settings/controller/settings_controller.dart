import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/constant/share_app.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/settings/screen/widget/show-alert_dialog.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  late String phoneNumber;
  late String formattingNumber;
  late Locale locale;
  late String themeMode;
  late String langeuage;
  late String showLangeuage;

  late ThemeData apptheme;

  @override
  void onInit() {
    super.onInit();
    langeuage = myServices.sharedPreferences.getString("locale")!;
    showLangeuage = langeuage == "en" ? "English" : "العربيه";
    themeMode = myServices.sharedPreferences.getString("theme")!;
    formattingPhoneNumber();
  }

  void showPopUp() {
    Get.dialog(buildAlertDialog(goToChangePhoneNumber));
  }

  void goToChangePhoneNumber() {
    Get.back();
    Get.toNamed(AppRoute.changephonenumber);
  }

  void LogOut() {
    myServices.sharedPreferences.clear();
    initialPosition();
    myServices.sharedPreferences.setString("theme", themeMode);
    myServices.sharedPreferences.setString("locale", langeuage);
    Get.offAllNamed(AppRoute.login);
  }

  void goToTermsRules() {
    Get.toNamed(AppRoute.rulesandterms);
  }

  void updateTheme(String mode) {
    apptheme = mode == "dark" ? ThemeData.dark() : ThemeData.light();
    themeMode = mode;
    myServices.sharedPreferences.setString("theme", mode);
    Get.changeTheme(apptheme);
    AppColor.updateTheme(themeMode);
    AppImage.updateThemeImage(themeMode);
    update();
  }

// تحديث الثيم بشكل معكوس

  void changeLocale(String codeLocale) {
    switch (codeLocale) {
      case "en":
        showLangeuage = "English";
        locale = Locale(codeLocale);
        break;
      case "ar":
        showLangeuage = "العربيه";
        locale = Locale(codeLocale);
        break;
      default:
    }
    langeuage = codeLocale;
    Get.updateLocale(locale);
  }

  List<Map<String, dynamic>> get settingsOptions => [
        {
          "text": "Phone number",
          "suppText": formattingNumber,
          "isTwo": true,
          "icon": Icons.arrow_forward_ios_outlined,
          "onTap": () {
            showPopUp();
          }
        },
        {
          "text": "Language",
          "suppText": showLangeuage,
          "icon": Icons.arrow_forward_ios_outlined,
          "isTwo": true,
          "onTap": () {
            changeLocale(langeuage == "en" ? "ar" : "en");
          }
        },
        {
          "text": "Night mode",
          "suppText": themeMode,
          "icon": Icons.arrow_forward_ios_outlined,
          "isTwo": true,
          "onTap": () {
            updateTheme(themeMode == "dark" ? "light" : "dark");
          }
        },
        {
          "text": "Rules and terms",
          "suppText": "",
          "icon": Icons.arrow_forward_ios_outlined,
          "isTwo": false,
          "onTap": () {
            goToTermsRules();
          }
        },
        {
          "text": "Log out",
          "suppText": "",
          "isTwo": false,
          "icon": null,
          "onTap": () {
            LogOut();
          }
        },
      ];

  Future<void> initialPosition() async {
    LocationPermission permission;
    Position position;

    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.deniedForever &&
        permission != LocationPermission.denied) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      myServices.sharedPreferences.setDouble("lat", position.latitude);
      myServices.sharedPreferences.setDouble("long", position.longitude);
    } else {
      // استخدام إحداثيات البيت الأبيض في حالة عدم توفر الإذن
      myServices.sharedPreferences.setDouble("lat", 31.024054);
      myServices.sharedPreferences.setDouble("long", 31.417328);
    }
  }

  void formattingPhoneNumber() {
    phoneNumber =
        myServices.sharedPreferences.getString(AppSharedpref.userPhoneNumber) ??
            "";
    if (phoneNumber.length >= 4) {
      String start = phoneNumber.substring(0, 3);
      String end = phoneNumber.substring(phoneNumber.length - 2);
      String maskedSection = '*' * (phoneNumber.length - 4);

      formattingNumber = '$start$maskedSection$end';
    } else {
      formattingNumber =
          phoneNumber; // If number is too short, just use it as is
    }
  }
}
