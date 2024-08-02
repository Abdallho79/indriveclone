import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_mab_controller.dart';
import 'package:indriveclone/page/find_driver/screen/widget/worker_card.dart';

class FindDriverBottomSheet extends StatelessWidget {
  const FindDriverBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    FindDriverController controller = Get.find();
    FindDriverMabController mapController = Get.find();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      constraints: BoxConstraints(maxHeight: Get.height / 2.7),
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: ListView.builder(
          itemCount: controller.drivers.length,
          itemBuilder: (context, index) {
            return WorkerCard(
              controller: controller,
              index: index,
              mapController: mapController,
            );
          },
        ),
      ),
    );
  }
}
