import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/constant/share_app.dart';
import 'package:indriveclone/core/services/services.dart';

class MyDrawerController extends GetxController {
  int isActive = 1;
  MyServices myServices = Get.find();
  late String username;
  String photoPath = "";

  void updateData(String name, String path) {
    username = name;
    photoPath = path;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    username = myServices.sharedPreferences.getString(AppSharedpref.userName)!;
    photoPath = myServices.sharedPreferences.getString(AppSharedpref.photo)!;
  }

  List<Map<String, dynamic>> categories = [
    {
      "name": "City",
      "icon": Icons.location_city,
      "index": 1,
      "navigate": (MyDrawerController controller) {
        controller.goToHome();
      }
    },
    {
      "name": "Request history",
      "icon": Icons.history,
      "index": 2,
      "navigate": (MyDrawerController controller) {
        controller.goToHistory();
      }
    },
    {
      "name": "City to city",
      "icon": Icons.language,
      "index": 3,
      "navigate": (MyDrawerController controller) {
        controller.goToCityToCith();
      }
    },
    {
      "name": "Freight",
      "icon": Icons.local_shipping_outlined,
      "index": 4,
      "navigate": (MyDrawerController controller) {
        controller.goToFreight();
      }
    },
    {
      "name": "Settings",
      "icon": Icons.settings_outlined,
      "index": 5,
      "navigate": (MyDrawerController controller) {
        controller.goToSettings();
      }
    },
    {
      "name": "Support",
      "icon": Icons.chat_outlined,
      "index": 6,
      "navigate": (MyDrawerController controller) {
        controller.goToSupport();
      }
    },
  ];

  goToProfile() {
    Get.toNamed(AppRoute.profileview);
  }

  setActvie(int index) {
    isActive = index;
    update();
  }

  void goToHome() {
    if (isActive != 1) {
      Get.offNamed(AppRoute.homeview);
    } else {
      Get.back();
    }
  }

  void goToHistory() {
    if (isActive != 2) {
      Get.offNamed(AppRoute.historyview);
    } else {
      Get.back();
    }
  }

  void goToCityToCith() {
    if (isActive != 3) {
      Get.offNamed(AppRoute.travelview);
    } else {
      Get.back();
    }
  }

  void goToFreight() {
    if (isActive != 4) {
      Get.offNamed(AppRoute.frieghtview);
    } else {
      Get.back();
    }
  }

  void goToSettings() {
    if (isActive != 5) {
      Get.offNamed(AppRoute.settings);
    } else {
      Get.back();
    }
  }

  void goToSupport() {
    if (isActive != 6) {
      Get.offNamed(AppRoute.support);
    } else {
      Get.back();
    }
  }
}
