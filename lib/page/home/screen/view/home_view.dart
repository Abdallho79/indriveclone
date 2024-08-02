import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/home/controller/map_home_controller.dart';
import 'package:indriveclone/page/home/screen/view/build_bottom_sheet.dart';
import 'package:indriveclone/page/home/screen/widget/build_buttons.dart';
import 'package:indriveclone/page/home/screen/widget/build_google_map_content.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MapHomeController());
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        onRefresh: controller.isThereInternet,
        widget: Scaffold(
          drawer: const MyDrawer(),
          body: Builder(
            builder: (context) => Stack(
              children: [
                const BuildGoogleMapHome(),
                buildMenuButton(context),
                buildShareButton(),
                buildBottomSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
