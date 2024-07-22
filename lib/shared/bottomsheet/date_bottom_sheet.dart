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

  const DateBottomSheet(
      {super.key, required this.controller, required this.isTravel});

  @override
  Widget build(BuildContext context) {
    // التحقق مما إذا كان يجب استخدام TravelController أو FreightController
    if (isTravel) {
      Get.put(TravelController());
      return Container(
        height: 500,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: GetBuilder<TravelController>(
          // استخدام TravelController أو FreightController بناءً على isTravel
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                if (controller.countDate == 1) ...[
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.days.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.SelectDate(controller.days[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: controller.selectedDate ==
                                      controller.days[index]
                                  ? AppColor.background_light
                                  : Colors.grey[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              controller.days[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  BottomSheetButton(
                    onPressed: () {
                      if (controller.selectedDate != "") {
                        controller.countDate = 2;
                        controller.update();
                      }
                    },
                    title: "Next",
                  ),
                ] else ...[
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.hours.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.SelectHour(controller.hours[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: controller.selectedDateHour ==
                                      controller.hours[index]
                                  ? AppColor.background_light
                                  : Colors.grey[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              controller.hours[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  BottomSheetButton(
                    onPressed: () {
                      if (controller.selectedDateHour != "") {
                        controller.countDate = 1;
                        controller.setAllDate(
                            "${controller.selectedDate} ,${controller.selectedDateHour}");

                        PrintString(
                            " controller.setAllDate", controller.setAllDate);
                        Get.back(); // يمكن استبدال هذا بخطوة أخرى حسب الحاجة
                      }
                    },
                    title: "Confirm",
                  ),
                ],
              ],
            );
          },
        ),
      );
    } else {
      Get.put(FreightController());
      return Container(
        height: 500,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: GetBuilder<FreightController>(
          // استخدام TravelController أو FreightController بناءً على isTravel
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                if (controller.countDate == 1) ...[
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.days.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.SelectDate(controller.days[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: controller.selectedDate ==
                                      controller.days[index]
                                  ? AppColor.background_light
                                  : Colors.grey[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              controller.days[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  BottomSheetButton(
                    onPressed: () {
                      if (controller.selectedDate != "") {
                        controller.countDate = 2;
                        controller.update();
                      }
                    },
                    title: "Next",
                  ),
                ] else ...[
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.hours.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.SelectHour(controller.hours[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: controller.selectedDateHour ==
                                      controller.hours[index]
                                  ? AppColor.background_light
                                  : Colors.grey[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              controller.hours[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  BottomSheetButton(
                    onPressed: () {
                      if (controller.selectedDateHour != "") {
                        controller.countDate = 1;
                        controller.setAllDate(
                            "${controller.selectedDate} ,${controller.selectedDateHour}");
                        Get.back(); // يمكن استبدال هذا بخطوة أخرى حسب الحاجة
                      }
                    },
                    title: "Confirm",
                  ),
                ],
              ],
            );
          },
        ),
      );
    }
  }
}
