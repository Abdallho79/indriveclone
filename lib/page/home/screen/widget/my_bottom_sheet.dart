import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/home/screen/widget/build_loction_widget.dart';
import 'package:indriveclone/page/home/screen/widget/build_services_section.dart';
import 'package:indriveclone/page/home/screen/widget/build_time_fare.dart';
import 'package:indriveclone/shared/widgets/main_button.dart';

ListView buildBottomSheetContent(HomeController controller) {
  return ListView(
    children: [
      buildServicesSection(controller),
      const SizedBox(height: 10),
      buildLocationWidget(controller, true, "From"),
      const SizedBox(height: 10),
      buildLocationWidget(controller, false, "To"),
      const SizedBox(height: 10),
      buildFareAndTimeSection(controller),
      const SizedBox(height: 20),
      _buildFindDriverButton(controller),
    ],
  );
}

SizedBox _buildFindDriverButton(HomeController controller) {
  return SizedBox(
    height: 60,
    width: Get.width,
    child: MyMainButton(
      onPressed: () {
        controller.findDriver();
      },
      title: "Find driver",
    ),
  );
}
