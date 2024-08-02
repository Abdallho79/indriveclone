import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';
import 'package:indriveclone/shared/bottomsheet/fare_bottom_sheet.dart';

class FareOfferWidget extends StatelessWidget {
  const FareOfferWidget({super.key});

  @override
  GetBuilder build(BuildContext context) {
    return GetBuilder<TravelController>(
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
              isDismissible: false, FareBottomSheet(controller: controller));
        },
        staticText: "Offer your fare",
        inputText: "${controller.fare}",
      ),
    );
  }
}
