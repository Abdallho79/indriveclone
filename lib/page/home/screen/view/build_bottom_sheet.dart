import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/home/controller/map_home_controller.dart';
import 'package:indriveclone/page/home/screen/widget/my_bottom_sheet.dart';

GetBuilder buildBottomSheet() {
  return GetBuilder<MapHomeController>(
    builder: (controller) => AnimatedPositioned(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
      bottom: controller.isContainerActive ? 0 : -400,
      left: 0,
      right: 0,
      child: const MyBottomSheet(),
    ),
  );
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColor.setBackGrounColor(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              height: controller.isAllSelected ? 430 : 350,
              width: Get.width,
              child: buildBottomSheetContent(controller),
            ));
  }
}
