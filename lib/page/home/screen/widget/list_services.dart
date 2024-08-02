import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/home/controller/home_controller.dart';

class ListViewSerivces extends StatelessWidget {
  const ListViewSerivces({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ServicesIcon(
          imagename: "Ride",
          name: AppImage.setRideColor(),
          onTap: () {
            controller.isCar("Ride");
          },
        ),
        const SizedBox(
          width: 15,
        ),
        ServicesIcon(
          imagename: "Moto",
          name: AppImage.setMotoColor(),
          onTap: () {
            controller.isCar("Moto");
          },
        ),
      ],
    );
  }
}

class ServicesIcon extends StatelessWidget {
  final String imagename;
  final String name;
  final void Function() onTap;

  const ServicesIcon({
    super.key,
    required this.imagename,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            name,
            height: 70,
            width: 70,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              imagename,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: -10,
            bottom: 10,
            child: GetBuilder<HomeController>(builder: (controller) {
              return imagename == controller.chooseCar
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: AppColor.green,
                    )
                  : const SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }
}
