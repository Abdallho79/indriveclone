import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';
import 'package:indriveclone/page/find_driver/screen/widget/find_driver_bottom_sheet.dart';
import 'package:indriveclone/page/find_driver/screen/widget/find_driver_map.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/appbar_title.dart';

class FindDriverView extends StatelessWidget {
  const FindDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FindDriverController());
    return const Scaffold(
      backgroundColor: AppColor.background_dark,
      bottomSheet: FindDriverBottomSheet(),
      appBar: AppBarTitle(title: "Find driver"),
      body: GoogleMapContentFindDriver(),
    );
  }
}



