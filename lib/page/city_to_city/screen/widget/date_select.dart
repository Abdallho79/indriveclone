import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/bottomsheet/date_bottom_sheet.dart';
import 'package:indriveclone/page/main_widget.dart';

class DateSelectionWidget extends StatelessWidget {
  const DateSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelController>(
      builder: (controller) => TheMainWidget(
        onPressed: () {
          Get.bottomSheet(isDismissible: false, const DateBottomSheetTravel());
        },
        staticText: "When",
        inputText: controller.selectedDate,
      ),
    );
  }
}
