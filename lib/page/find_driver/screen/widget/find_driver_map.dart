import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';

class GoogleMapContentFindDriver extends StatelessWidget {
  const GoogleMapContentFindDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<FindDriverController>(
              builder: (controller) {
                return GoogleMap(
                  initialCameraPosition: controller.initialPosition,
                  markers: controller.markers.toSet(),
                  polylines: controller.polylineSet,
                  mapType: MapType.normal,
                  onMapCreated: controller.onMapCreated,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
