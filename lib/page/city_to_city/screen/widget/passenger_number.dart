import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/bottomsheet/number_bottom_sheet.dart';
import 'package:indriveclone/page/main_widget.dart';

class PassengerNumberWidget extends StatelessWidget {
  const PassengerNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelController>(
      builder: (controller) => TheMainWidget(
        onPressed: () {
          Get.bottomSheet(
            isDismissible: false,
            const NumberPassengersBottomSheetTravel(),
          );
        },
        staticText: controller.isPrivteRide
            ? "Number of passengers"
            : "Number of seats",
        inputText: "${controller.numberPassengers1}",
      ),
    );
  }
}
