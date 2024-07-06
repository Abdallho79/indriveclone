import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';

backToHome(BuildContext context) async {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomeView()),
      (route) => false);
  Get.find<MyDrawerController>().isActive = 1;
  // return Future.value(true); // Allow pop});
}
