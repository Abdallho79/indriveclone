import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/main_widget.dart';
import 'package:indriveclone/shared/bottomsheet/date_bottom_sheet.dart';

class DateSelectionWidget extends StatelessWidget {
  const DateSelectionWidget({super.key});

  @override
  GetBuilder build(BuildContext context) {
    return GetBuilder<TravelController>(
      builder: (controller) => TheMainWidget(
        onPressed: () {
              controller.generateDays();

          Get.bottomSheet(
              isDismissible: false, DateBottomSheet(controller: controller, isTravel: true,));
        },
        staticText: "When",
        inputText: controller.allDate,
      ),
    );
  }
}
