import 'package:flutter/material.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/page/history/controller/ride_details_controller.dart';
import 'package:indriveclone/page/history/screen/widget/coustom_icon_text_row.dart';

Column buildDetailsSection(RideDetailsController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const MyCoustomText(
        text: "Details",
        weight: FontWeight.normal,
        size: 26,
        textAlign: null,
      ),
      const SizedBox(height: 10),
      CoustomTextIconRow(
        icon: Icons.circle,
        text: " From : ${controller.data.travelFromName!}",
        iconColor: Colors.green,
      ),
      CoustomTextIconRow(
        icon: Icons.circle,
        text: "To : ${controller.data.travelToName!}",
        iconColor: Colors.red,
      ),
      CoustomTextIconRow(
        icon: Icons.attach_money_rounded,
        text: "Fare : ${controller.data.travelCost!}",
        iconColor: null,
      ),
    ],
  );
}
