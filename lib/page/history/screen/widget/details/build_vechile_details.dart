import 'package:flutter/material.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/page/history/controller/ride_details_controller.dart';
import 'package:indriveclone/page/history/screen/widget/coustom_icon_text_row.dart';

Column buildVehicleSection(RideDetailsController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const MyCoustomText(
        text: "Vehicle",
        weight: FontWeight.normal,
        size: 26,
        textAlign: null,
      ),
      CoustomTextIconRow(
        icon: Icons.local_taxi,
        text: controller.data.driverCarModel!,
        iconColor: null,
      ),
    ],
  );
}
