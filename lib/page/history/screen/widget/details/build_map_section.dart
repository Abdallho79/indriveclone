import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/page/history/controller/ride_details_controller.dart';

SizedBox buildMapSection(RideDetailsController controller) {
  return SizedBox(
    height: 200,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          GetBuilder<RideDetailsController>(
            builder: (controller) {
              return Expanded(
                child: GoogleMap(
                  initialCameraPosition: controller.initialPosition!,
                  markers: controller.markers.toSet(),
                  polylines: controller.polylines,
                  onMapCreated: controller.onMapCreated,
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
