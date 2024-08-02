import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';
import 'package:indriveclone/shared/bottomsheet/number_bottom_sheet.dart';

class PassengerNumberWidget extends StatelessWidget {
  const PassengerNumberWidget({super.key});

  @override
  GetBuilder build(BuildContext context) {
    return GetBuilder<TravelController>(
      builder: (controller) => TheMainWidget(
        onPressed: () {
          Get.bottomSheet(
            isDismissible: false,
            NumberPassengersBottomSheet(controller: controller),
          );
        },
        staticText: controller.isPrivteRide
            ? "Number of passengers"
            : "Number of seats",
        inputText: "${controller.numberPassengersShow}",
      ),
    );
  }
}
