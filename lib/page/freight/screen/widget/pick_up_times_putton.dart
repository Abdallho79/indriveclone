import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/page/freight/screen/widget/button_time.dart';
import 'package:indriveclone/shared/bottomsheet/date_bottom_sheet.dart';

class PickupTimeButtons extends StatelessWidget {
  const PickupTimeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FreightController>(
      builder: (controller) => Row(
        children: [
          TimeElevatedButton(
            onPressed: () {
              controller.changePickUpStatus(1);
              controller.selectedDate = "";
            },
            text: "10-20 min",
            isActive: controller.pickuptime,
            isActivenumber: 1,
          ),
          const SizedBox(width: 15),
          TimeElevatedButton(
            onPressed: () {
              controller.changePickUpStatus(2);
              controller.selectedDate = "";
            },
            text: "Up to 1 hour",
            isActive: controller.pickuptime,
            isActivenumber: 2,
          ),
          const SizedBox(width: 15),
          TimeElevatedButton(
            onPressed: () {
              controller.generateDays();
              Get.bottomSheet(DateBottomSheet(
                controller: controller,
                isTravel: false,
              ));
              controller.changePickUpStatus(3);
            },
            text: controller.allDate == ""
                ? "Schedule delivery"
                : controller.allDate,
            isActive: controller.pickuptime,
            isActivenumber: 3,
          ),
        ],
      ),
    );
  }
}
