import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/home/controller/map_home_controller.dart';
import 'package:indriveclone/page/home/screen/widget/google_,map_content.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';
import 'package:indriveclone/page/home/screen/view/my_bottom_sheet.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/coustom_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MapHomeController());
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: Builder(
        builder: (context) => Stack(
          children: [
            GoogleMapContentHome(),
            Positioned(
              left: 15,
              top: 20,
              child: CoustomIconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icons.menu,
              ),
            ),
            Positioned(
              right: 15,
              top: 20,
              child: CoustomIconButton(
                onPressed: () {},
                icon: Icons.share,
              ),
            ),
            GetBuilder<MapHomeController>(
              builder: (controller) => AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                bottom: controller.isContainerActive ? 0 : -400,
                left: 0,
                right: 0,
                child: MyBottomSheet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColor.background_dark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: 300,
      width: Get.width,
      child: buildBottomSheetContent(homeController),
    );
  }
}
