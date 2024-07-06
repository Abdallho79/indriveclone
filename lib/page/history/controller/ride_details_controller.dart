import 'package:flutter/material.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';

class RideDetailsController extends HistoryController {
  @override
  // ignore: overridden_fields
  List rideDetails = [
    {
      "icon": Icons.circle,
      "text": "El-Galaa (El Mansoura)",
      "color": Colors.green
    },
    {
      "icon": Icons.circle,
      "text": "Sallant (El Mansoura)",
      "color": Colors.red
    },
    {"icon": Icons.access_time, "text": "17 min", "color": Colors.white},
    {"icon": Icons.money, "text": "EGP 61", "color": Colors.white},
  ];
}
