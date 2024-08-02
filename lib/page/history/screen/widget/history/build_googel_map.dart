
  import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';

Widget buildGoogleMap(HistoryController controller, int index) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GoogleMap(
          onMapCreated: (GoogleMapController googleMapController) {
            controller.onMapCreated1(googleMapController, index);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(
              controller.data[index].travelFromLat!,
              controller.data[index].travelFromLong!,
            ),
            zoom: 15,
          ),
          markers: controller.allMarkers[index].toSet(),
          polylines: controller.allPolyLines[index],
        ),
      ),
    );
  }

