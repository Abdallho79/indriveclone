import 'package:flutter/material.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';


Text buildFareText(HistoryController controller, int index) {
  return Text(
    "Fare: ${controller.data[index].travelCost}",
    style: const TextStyle(fontSize: 22),
  );
}
