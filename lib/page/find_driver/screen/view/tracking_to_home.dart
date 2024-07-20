import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/find_driver/controller/tracking_controller.dart';

class TrackingToUserHomeView extends StatelessWidget {
  const TrackingToUserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingController controller = Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColor.background_light,
                      contentPadding: EdgeInsets.zero,
                      content: Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.driverReachUser();
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.blue, // لون الخلفية
                                  borderRadius:
                                      BorderRadius.circular(20), // شكل مقوس
                                ),
                                child: const Text(
                                  "Is driver has arrive ? ",
                                  style: TextStyle(
                                    color: Colors.white, // لون النص
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.question_answer),
          )
        ],
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<TrackingController>(
                builder: (controller) {
                  return HandlingDataView(
                      statusRequest: controller.statusRequest,
                      onRefresh: controller.isThereInternet,
                      widget: GoogleMap(
                        initialCameraPosition: controller.initialPosition!,
                        markers: controller.markers.toSet(),
                        polylines: controller.Polylineset,
                        mapType: MapType.normal,
                        onMapCreated: controller.onMapCreated,
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
