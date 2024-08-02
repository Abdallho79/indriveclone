import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/find_driver/controller/tracking_controller.dart';
import 'package:indriveclone/page/find_driver/controller/tracking_controller_ui.dart';
import 'package:indriveclone/page/find_driver/controller/tracking_controller_map.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/coustom_icon.dart';

class TrackingToUserHomeView extends StatelessWidget {
  const TrackingToUserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingMapController maopController = Get.put(TrackingMapController());
    Get.put(TrackingController());

    TrackingUIController controller = Get.put(TrackingUIController());
    return Scaffold(
      appBar: _buildAppBar(context, maopController, controller),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context,
      TrackingMapController maopController, TrackingUIController controller) {
    return AppBar(
      title: const Text("Tracking"),
      actions: [
        IconButton(
          iconSize: 28,
          onPressed: () =>
              _showDriverArrivalDialog(context, maopController, controller),
          icon: const Icon(Icons.question_mark_outlined),
        ),
        MaterialButton(
            minWidth: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            // onPressed: () => controller.openWhatsApp,
            onPressed: () {},
            child: Image.asset(
              AppImage.whatsapp,
              width: 30,
              height: 30,
            )),
      ],
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<TrackingMapController>(
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDriverArrivalDialog(BuildContext context,
      TrackingMapController maopController, TrackingUIController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(alignment: Alignment.topRight, child: buildButton()),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyCoustomText(
                      text: "Fare: ${controller.fare}",
                      weight: FontWeight.normal,
                      size: 18,
                      textAlign: TextAlign.start),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: MyCoustomText(
                        text:
                            "Driver name: ${controller.selectedDriverData.driverName}",
                        weight: FontWeight.normal,
                        size: 18,
                        textAlign: TextAlign.start)),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: MyCoustomText(
                        text:
                            "Car Brand: ${controller.selectedDriverData.driverCarModel}",
                        weight: FontWeight.normal,
                        size: 18,
                        textAlign: TextAlign.start)),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: MyCoustomText(
                        text:
                            "Phone: ${controller.selectedDriverData.driverPhoneNumber}",
                        weight: FontWeight.normal,
                        size: 18,
                        textAlign: TextAlign.start)),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<TrackingMapController>(
                  builder: (controller) => InkWell(
                    onTap: () {
                      controller.driverReachUser();
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        controller.message,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

CoustomIconButton buildButton() {
  return CoustomIconButton(
    onPressed: () {
      Get.back();
    },
    icon: Icons.clear,
  );
}
