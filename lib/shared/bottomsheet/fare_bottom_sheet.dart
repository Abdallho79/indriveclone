import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

// ignore: must_be_immutable
class FareBottomSheet extends StatelessWidget {
  late RequiredDeatils controller;

  FareBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
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
          Center(
              child: RowTitle(
            title: "Offer your fare",
            onPressed: () {
              Get.back();
              controller.setFare();
            },
          )),
          const SizedBox(height: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextField(
                  showCursor: false,
                  controller: controller.fareController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 26),
                  decoration: InputDecoration(
                    prefixText: 'EGP ',
                    prefixStyle: const TextStyle(fontSize: 26),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.setBackGrounColor(),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.setBackGrounColor(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                BottomSheetButton(
                    onPressed: () {
                      controller.setFare();
                    },
                    title: "Done")
              ],
            ),
          )
        ],
      ),
    );
  }
}
