import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/page/freight/screen/widget/bottomsheet/fare_bottom_sheet.dart';
import 'package:indriveclone/page/main_widget.dart';

class FareFreight extends StatelessWidget {
  const FareFreight({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FreightController>(
      builder: (controller) => TheMainWidget(
        onPressed: () {
          Get.bottomSheet(isDismissible: false, FareBottomSheetFreight());
        },
        staticText: "Offer your Fare",
        inputText: "${controller.fare}",
      ),
    );
  }
}
