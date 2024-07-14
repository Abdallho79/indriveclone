import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/home/screen/widget/list_services.dart';

Widget buildServicesSection(HomeController controller) {
  return GetBuilder<HomeController>(
    builder: (controller) {
      if (controller.isAllSelected) {
        return const SizedBox(height: 10);
      } else {
        return const SizedBox(
          height: 100,
          child: ListViewSerivces(), // Assuming this is a custom widget
        );
      }
    },
  );
}
