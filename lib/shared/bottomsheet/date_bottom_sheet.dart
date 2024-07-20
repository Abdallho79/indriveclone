import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

// ignore: must_be_immutable
class DateBottomSheetFreight extends StatelessWidget {
  late RequiredDeatils controller;

  DateBottomSheetFreight({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const RowTitle(title: "Departure date"),
          const SizedBox(height: 10),
          Expanded(
            child: GetBuilder<FreightController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.days.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectDate(controller.days[index]);
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color:
                              controller.selectedDate == controller.days[index]
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
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          BottomSheetButton(onPressed: () {}, title: "Next")
        ],
      ),
    );
  }
}
