import 'package:flutter/material.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';
import 'package:indriveclone/page/history/screen/widget/history/build_googel_map.dart';

Widget buildMapOrLoader(HistoryController controller, int index) {
  if (controller.allMarkers.length > index &&
      controller.allPolyLines.length > index) {
    return buildGoogleMap(controller, index);
  } else {
    return const SizedBox(
      height: 200,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
