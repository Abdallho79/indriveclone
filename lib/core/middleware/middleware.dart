import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/services/services.dart';

class MyMiddaleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("phonenumber") != null) {
      // if (myServices.sharedPreferences.getBool("isUserInTrackingMood") == true) {
      //   return const RouteSettings(name: AppRoute.trackingtohome);
      // }
      return const RouteSettings(name: AppRoute.homeview);
    }

    return null;
  }
}
