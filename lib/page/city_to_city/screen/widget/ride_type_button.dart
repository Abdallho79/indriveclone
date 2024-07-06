import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';

class RideTypeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<TravelController>();

    return GetBuilder<TravelController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            splashColor: AppColor.background_dark,
            onPressed: () {
              controller.changeRideStatus(true);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppImage.privateride,
                  height: 80,
                  width: 80,
                ),
                if (!controller.isPrivteRide)
                  Positioned(
                    bottom: 8,
                    left: 5,
                    child: MyCoustomText(
                      text: 'Private ride',
                      color: Colors.white,
                      weight: FontWeight.normal,
                      size: 12,
                      textAlign: TextAlign.start,
                    ),
                  ),
                if (controller.isPrivteRide)
                  Positioned(
                    bottom: 9,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
          MaterialButton(
            splashColor: AppColor.background_dark,
            onPressed: () {
              controller.changeRideStatus(false);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppImage.sharedride,
                  height: 80,
                  width: 80,
                ),
                if (controller.isPrivteRide)
                  Positioned(
                    bottom: 8,
                    left: 5,
                    child: MyCoustomText(
                      text: 'Shared ride',
                      color: Colors.white,
                      weight: FontWeight.normal,
                      size: 12,
                      textAlign: TextAlign.start,
                    ),
                  ),
                if (!controller.isPrivteRide)
                  Positioned(
                    bottom: 9,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
