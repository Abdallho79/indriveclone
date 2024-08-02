import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

class DateBottomSheet extends StatelessWidget {
  final RequiredDeatils controller;
  final bool isTravel;

  const DateBottomSheet({
    super.key,
    required this.controller,
    required this.isTravel,
  });

  @override
  Widget build(BuildContext context) {
    // اختيار نوع الـ Controller بناءً على isTravel
    if (isTravel) {
      return _buildBottomSheet<TravelController>();
    } else {
      return _buildBottomSheet<FreightController>();
    }
  }

  // تحديد T كنوع فرعي من GetxController
  Widget _buildBottomSheet<T extends GetxController>() {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.setBackGrounColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: GetBuilder<T>(
        builder: (controller) {
          // تحويل controller إلى النوع الصحيح
          final dynamicController = controller as dynamic;

          // تحديد الحالة إذا كان يتم اختيار التاريخ أو الساعة
          bool isSelectingDate = dynamicController.countDate == 1;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              if (isSelectingDate)
                _buildDateList(dynamicController)
              else
                _buildHourList(dynamicController),
              const SizedBox(height: 10),
              BottomSheetButton(
                onPressed: () {
                  if (isSelectingDate) {
                    if (dynamicController.selectedDate != "") {
                      dynamicController.countDate = 2;
                      dynamicController.update();
                    }
                  } else {
                    if (dynamicController.selectedDateHour != "") {
                      dynamicController.countDate = 1;
                      dynamicController.setAllDate(
                        "${dynamicController.selectedDate} ,${dynamicController.selectedDateHour}",
                      );
                      PrintString("dynamicController.setAllDate",
                          dynamicController.setAllDate);
                      Get.back();
                    }
                  }
                },
                title: isSelectingDate ? "Next" : "Confirm",
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDateList(dynamic controller) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.days.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.SelectDate(controller.days[index]),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: controller.selectedDate == controller.days[index]
                    ? AppColor.setIsActiveLightColor()
                    : AppColor.setBackGrounColor(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                controller.days[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHourList(dynamic controller) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.hours.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.SelectHour(controller.hours[index]),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: controller.selectedDateHour == controller.hours[index]
                    ? AppColor.setIsActiveLightColor()
                    : AppColor.setBackGrounColor(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                controller.hours[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
