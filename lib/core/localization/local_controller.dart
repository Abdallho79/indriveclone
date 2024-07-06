import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/theme_app.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:geolocator/geolocator.dart';

class LocalController extends GetxController {
  MyServices myServices = Get.find();
  late Locale language;
  ThemeData apptheme = AppTheme.themeEnglish;
  changeLocale(String codeLocale) {
    switch (codeLocale) {
      case "en":
        language = Locale(codeLocale);
        Get.updateLocale(language);
        Get.changeTheme(AppTheme.themeEnglish);
        break;
      case "ar":
        language = Locale(codeLocale);
        Get.updateLocale(language);
        Get.changeTheme(AppTheme.themeArabic);
        break;
      default:
    }
  }

  requestPermissoinLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Get.snackbar("notice", "Open Location Services");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Get.snackbar("notice", "Open Location Services");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar(
          "notice", "You can't use this app without location permission");
    }
  }

  @override
  void onInit() {
    requestPermissoinLocation();
    String locale = myServices.sharedPreferences.getString("locale") == null
        ? Get.deviceLocale!.languageCode
        : myServices.sharedPreferences.getString("locale")!;
    switch (locale) {
      case "en":
        language = Locale(locale);
        Get.updateLocale(language);
        Get.changeTheme(AppTheme.themeEnglish);
        break;
      case "ar":
        language = Locale(locale);
        Get.updateLocale(language);
        Get.changeTheme(AppTheme.themeArabic);
        break;
      default:
        language = Locale("en");
        Get.updateLocale(language);
        Get.changeTheme(AppTheme.themeEnglish);
    }
    super.onInit();
  }
}
