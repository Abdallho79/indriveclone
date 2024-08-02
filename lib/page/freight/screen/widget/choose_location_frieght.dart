import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';

GetBuilder buildChooseLocationFright(
    FreightController controller, bool isFrom, String staticText) {
  return GetBuilder<FreightController>(
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
