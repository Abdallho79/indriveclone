import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/page/freight/screen/widget/bottomsheet/fare_bottom_sheet.dart';
import 'package:indriveclone/page/main_widget.dart';

import '../../controller/home_controller.dart';

Widget buildFareAndTimeSection(HomeController controller) {
  return GetBuilder<HomeController>(
    builder: (controller) {
      if (controller.isAllSelected) {
        return Column(
          children: [
            SizedBox(
              height: 50,
              child: TheMainWidget(
                onPressed: () {
                  Get.bottomSheet(
                      isDismissible: false, const FareBottomSheetFreight());
                },
                inputText: "${controller.recommendedFare}${controller.fare} \$",
                staticText: "Fare",
              ),
            ),
            const SizedBox(height: 10),
            MyCoustomText(
              text: "Time: ${controller.time}",
              color: Colors.white,
              weight: FontWeight.bold,
              size: 20,
              textAlign: TextAlign.start,
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    },
  );
}
