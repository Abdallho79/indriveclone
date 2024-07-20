  import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/home/controller/map_home_controller.dart';
import 'package:indriveclone/page/home/screen/view/my_bottom_sheet.dart';

GetBuilder buildBottomSheet() {
    return GetBuilder<MapHomeController>(
      builder: (controller) => AnimatedPositioned(
        duration: const Duration(milliseconds: 1000),
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
    HomeController homeController = Get.find();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: AppColor.background_dark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: 350,
      width: Get.width,
      child: buildBottomSheetContent(homeController),
    );
  }
}
