import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_mab_controller.dart';
import 'package:indriveclone/page/find_driver/screen/widget/find_driver_bottom_sheet.dart';
import 'package:indriveclone/page/find_driver/screen/widget/find_driver_map.dart';
import 'package:indriveclone/shared/appbar_title.dart';

class FindDriverView extends StatelessWidget {
  const FindDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FindDriverController());
    Get.put(FindDriverMabController());
    return GetBuilder<FindDriverController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            onRefresh: controller.isThereInternet,
            widget: const Scaffold(
                appBar: AppBarTitle(title: "Find driver"),
                body: Stack(
                  children: [
                    GoogleMapContentFindDriver(),
                    BuildBottomShettFindDriver(),
                    // Positioned(
                    //   child: BuildBottomShettFindDriver(),
                    // )
                  ],
                ))));
  }
}

class BuildBottomShettFindDriver extends StatelessWidget {
  const BuildBottomShettFindDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FindDriverMabController>(
      builder: (controller) => AnimatedPositioned(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        bottom: controller.isContainerActive ? 0 : -400,
        left: 0,
        right: 0,
        child: const FindDriverBottomSheet(),
      ),
    );
  }
}
