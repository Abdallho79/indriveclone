import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/page/find_driver/controller/tracking_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/appbar_title.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class TrackingToUserHomeView extends StatelessWidget {
  const TrackingToUserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
      appBar: const AppBarTitle(title: "Tracking"),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<TrackingController>(
                builder: (controller) {
                  return GoogleMap(
                    initialCameraPosition: controller.initialPosition,
                    markers: controller.markers.toSet(),
                    polylines: controller.Polylineset,
                    mapType: MapType.normal,
                    onMapCreated: controller.onMapCreated,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: GetBuilder<TrackingController>(
        builder: (controller) {
          return Container(
            height:
                !controller.isDriverArrive && controller.timeDriverToUser == 0
                    ? 150
                    : 85,
            width: Get.width,
            color: AppColor.background_dark,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the start (left)
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (controller.isDriverArrive)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time to arrive to home: ${controller.formatDuration(controller.timeUserToHome)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Distance between you and driver: ${controller.distaceUserToHome}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                if (!controller.isDriverArrive)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Drive time to arrive : ${controller.formatDuration(controller.timeDriverToUser)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Distance between you and driver: ${controller.distaceDriverToUser}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                if (!controller.isDriverArrive &&
                    controller.timeDriverToUser == 0)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Is driver arrive ? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(AppColor.green)),
                                onPressed: () {
                                  controller.driverNotArriveYet(true);
                                },
                                child: const MyCoustomText(
                                  text: "Yes",
                                  color: Colors.white,
                                  weight: FontWeight.normal,
                                  size: 16,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Colors.red[400])),
                                onPressed: () {
                                  controller.driverNotArriveYet(false);
                                },
                                child: const MyCoustomText(
                                  text: "No",
                                  color: Colors.white,
                                  weight: FontWeight.normal,
                                  size: 16,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
