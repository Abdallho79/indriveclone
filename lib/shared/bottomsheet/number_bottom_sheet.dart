import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

class NumberPassengersBottomSheet extends StatelessWidget {
  final RequiredDeatils controller;

  const NumberPassengersBottomSheet({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.setBackGrounColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RowTitle(
            title: "How many of you will go?",
            onPressed: () {
              controller.numberPassengersCounter =
                  controller.numberPassengersShow;
              Get.back();
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    AppColor.setIsActiveLightColor(),
                  ),
                ),
                iconSize: 30,
                onPressed: () {
                  controller.incrementPassengers();
                },
                icon: const Icon(Icons.add),
              ),
              GetBuilder<TravelController>(
                builder: (controller) => MyCoustomText(
                  text: "${controller.numberPassengersCounter}",
                  weight: FontWeight.bold,
                  size: 24,
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    AppColor.setIsActiveLightColor(),
                  ),
                ),
                iconSize: 30,
                onPressed: () {
                  controller.decrementPassengers();
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          const Spacer(),
          BottomSheetButton(
            onPressed: () {
              controller.selectPassengers(controller.numberPassengersCounter);
              Get.back();
            },
            title: "Done",
          ),
        ],
      ),
    );
  }
}
