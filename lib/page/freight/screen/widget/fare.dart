import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';
import 'package:indriveclone/shared/bottomsheet/fare_bottom_sheet.dart';

class FareFreight extends StatelessWidget {
  const FareFreight({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FreightController>(
      builder: (controller) => TheMainWidget(
        onPressed: () {
          if (controller.fareController!.text == "") {
            controller.fareController!.text = "0";
          }
          controller.fareController!.text =
              controller.minfare >= int.parse(controller.fareController!.text)
                  ? controller.minfare.toString()
                  : controller.fareController!.text;

          Get.bottomSheet(
              isDismissible: false,
              FareBottomSheet(
                controller: controller,
              ));
        },
        staticText: "Offer your Fare",
        inputText: "${controller.fare}",
      ),
    );
  }
}
