import 'package:flutter/material.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';
import 'package:indriveclone/page/history/screen/widget/history/build_date.dart';
import 'package:indriveclone/page/history/screen/widget/history/build_fare.dart';
import 'package:indriveclone/page/history/screen/widget/history/build_map_or_loader.dart';
import 'package:indriveclone/page/history/screen/widget/history/buiuld_travel_route.dart';

InkWell buildHistoryCard(HistoryController controller, int index) {
  return InkWell(
    onTap: () => controller.goToDetails(index),
    child: Card(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDateText(controller),
            const SizedBox(height: 10),
            buildFareText(controller, index),
            const SizedBox(height: 10),
            buildTravelRoute(controller, index),
            const SizedBox(height: 20),
            buildMapOrLoader(controller, index),
          ],
        ),
      ),
    ),
  );
}
