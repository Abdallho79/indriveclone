import 'package:flutter/material.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';
import 'package:indriveclone/page/history/screen/widget/coustom_icon_text_row.dart';

Column buildTravelRoute(HistoryController controller, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CoustomTextIconRow(
        icon: Icons.circle,
        text: controller.data[index].travelFromName!,
        iconColor: Colors.green,
      ),
      CoustomTextIconRow(
        icon: Icons.circle,
        text: controller.data[index].travelToName!,
        iconColor: Colors.red,
      ),
    ],
  );
}
