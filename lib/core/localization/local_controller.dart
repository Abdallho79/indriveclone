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
      Get.snackbar("notice", "Open Location Services", colorText: Colors.white);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("notice", "Open Location Services",
            colorText: Colors.white);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar("notice",
          "You can't get a good expirence without location permission",
          colorText: Colors.white);
    }
    await initialPosition();
  }

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
        language = const Locale("en");
        Get.updateLocale(language);
        Get.changeTheme(AppTheme.themeEnglish);
    }
    super.onInit();
  }
}
