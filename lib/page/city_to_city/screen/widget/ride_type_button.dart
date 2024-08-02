import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';

class RideTypeButtons extends StatelessWidget {
  const RideTypeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<TravelController>();

    return GetBuilder<TravelController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RideButton(
            isSelected: controller.isPrivteRide,
            isPrivate: true,
            onPressed: () {
              controller.changeRideStatus(true);
            },
          ),
          RideButton(
            isSelected: !controller.isPrivteRide,
            isPrivate: false,
            onPressed: () {
              controller.changeRideStatus(false);
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class RideButton extends StatelessWidget {
  final bool isSelected;
  final bool isPrivate;
  final VoidCallback onPressed;

  const RideButton({
    super.key,
    required this.isSelected,
    required this.isPrivate,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            isPrivate ? AppImage.setPrivateColor() : AppImage.setSharedColor(),
            height: 80,
            width: 80,
          ),
          Positioned(
            bottom: 8,
            left: 5,
            child: MyCoustomText(
              text: isPrivate ? 'Private ride' : 'Shared ride',
              weight: FontWeight.normal,
              size: 12,
              textAlign: TextAlign.start,
            ),
          ),
          if (isSelected)
            const Positioned(
              bottom: -10,
              right: -10,
              child: Icon(
                Icons.check_circle,
                color: AppColor.green,
                size: 24,
              ),
            ),
        ],
      ),
    );
  }
}
