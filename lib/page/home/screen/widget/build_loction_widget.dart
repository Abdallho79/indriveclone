import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/main_widget.dart';

GetBuilder buildLocationWidget(
    HomeController controller, bool isFrom, String staticText) {
  return GetBuilder<HomeController>(
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
