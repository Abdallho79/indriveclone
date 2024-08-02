import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';
import 'package:indriveclone/page/home/screen/widget/list_services.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/coustom_icon.dart';

GetBuilder buildServicesSection(HomeController controller) {
  return GetBuilder<HomeController>(
    builder: (controller) {
      if (controller.isAllSelected) {
        return ClearProgressRow(
          title: controller.chooseCar,
          onPressed: () {
            controller.cancelProgress();
          },
          imagePath:
              controller.chooseCar == "Ride" ? AppImage.setRideColor() : AppImage.setMotoColor(),
        );
      } else {
        return const SizedBox(
          height: 100,
          child: ListViewSerivces(), // Assuming this is a custom widget
        );
      }
    },
  );
}

class ClearProgressRow extends StatelessWidget {
  final String title;
  final String imagePath;
  final void Function() onPressed;
  const ClearProgressRow(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Image.asset(
              imagePath,
              height: 70,
              width: 70,
            ),
          ],
        ),
        CoustomIconButton(
          onPressed: onPressed,
          icon: Icons.clear_rounded,
        ),
      ],
    );
  }
}
