import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';

GetBuilder buildChooseLocationWidget(
    TravelController controller, bool isFrom, String staticText) {
  return GetBuilder<TravelController>(
    builder: (controller) => SizedBox(
      height: 50,
      child: TheMainWidget(
        onPressed: () {
          controller.goToChooseLocation(isFrom);
        },
        inputText: isFrom ? controller.fromName : controller.toName,
        staticText: staticText,
      ),
    ),
  );
}
