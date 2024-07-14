import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/page/home/screen/widget/fare_bottom_sheet.dart';
import 'package:indriveclone/page/main_widget.dart';

import '../../controller/home_controller.dart';

Widget buildFareAndTimeSection(HomeController controller) {
  return GetBuilder<HomeController>(
    builder: (controller) {
      if (controller.isAllSelected) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: TheMainWidget(
                onPressed: () {
                  Get.bottomSheet(
                      isDismissible: false, const FareBottomSheetHome());
                },
                inputText: "${controller.recommendedFare}${controller.fare} \$",
                staticText: "Fare",
              ),
            ),
            const SizedBox(height: 20),
            MyCoustomText(
              text: "Time: ${controller.time}",
              color: Colors.white,
              weight: FontWeight.bold,
              size: 20,
              textAlign: null,
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    },
  );
}
