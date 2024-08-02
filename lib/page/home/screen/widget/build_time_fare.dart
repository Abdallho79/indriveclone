import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';
import 'package:indriveclone/shared/bottomsheet/fare_bottom_sheet.dart';

import '../../controller/home_controller.dart';

GetBuilder buildFareAndTimeSection(HomeController controller) {
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
                    isDismissible: false,
                    FareBottomSheet(
                      controller: controller,
                    ),
                  );
                },
                inputText: "${controller.recommendedFare}${controller.fare} \$",
                staticText: "Fare",
              ),
            ),
            const SizedBox(height: 20),
            MyCoustomText(
              text: "Time: ${controller.time}",
              
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
