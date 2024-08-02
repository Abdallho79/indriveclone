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
          _buildTimeButton(
            onPressed: () {
              controller.changePickUpStatus(1);
              controller.selectedDate = "";
            },
            text: "10-20 min",
            isActive: controller.pickuptime,
            isActivenumber: 1,
          ),
          const SizedBox(width: 15),
          _buildTimeButton(
            onPressed: () {
              controller.changePickUpStatus(2);
              controller.selectedDate = "";
            },
            text: "Up to 1 hour",
            isActive: controller.pickuptime,
            isActivenumber: 2,
          ),
          const SizedBox(width: 15),
          _buildTimeButton(
            onPressed: () {
              controller.generateDays();
              Get.bottomSheet(
                DateBottomSheet(
                  controller: controller,
                  isTravel: false,
                ),
              );
              controller.changePickUpStatus(3);
            },
            text: controller.allDate.isEmpty
                ? "Schedule delivery"
                : controller.allDate,
            isActive: controller.pickuptime,
            isActivenumber: 3,
          ),
        ],
      ),
    );
  }

  TimeElevatedButton _buildTimeButton({
    required VoidCallback onPressed,
    required String text,
    required int isActive,
    required int isActivenumber,
  }) {
    return TimeElevatedButton(
      onPressed: onPressed,
      text: text,
      isActive: isActive,
      isActivenumber: isActivenumber,
    );
  }
}
