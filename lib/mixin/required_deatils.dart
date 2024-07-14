import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/home/controller/map_home_controller.dart';

mixin RequiredDeatilsMixIn {
  TextEditingController? fareController;
  MapHomeController mapController = Get.find();
  int fare = 0;
  String recommendedFare = "Recommended :  ";

  // Variables to store the "from" and "to" locations
  double? fromLat;
  double? fromLong;
  String fromName = "";
  double? toLat;
  double? toLong;
  String toName = "";
  // Set the location (from/to) and update the respective variables
  void setLocation({
    required double lat,
    required double long,
    required String name,
    required bool isFrom,
  }) {
    if (isFrom) {
      fromLat = lat;
      fromLong = long;
      fromName = name;
      mapController.addMarkers(lat, long, isFrom);
    } else {
      toLat = lat;
      toLong = long;
      toName = name;
      mapController.addMarkers(lat, long, isFrom);
    }
  }



  // Validate the fare and update the fare variable accordingly
  void validate(int miniumFare) {
    if (fareController!.text.isNotEmpty) {
      if (miniumFare <= int.parse(fareController!.text)) {
        fare = int.parse(fareController!.text);
        recommendedFare = "";
        Get.back();
      } else {
        recommendedFare = "Recommended :  ";
        Get.snackbar("Error", "Fare Can't be less than $miniumFare");
      }
    } else {
      recommendedFare = "Recommended :  ";
      Get.back();
    }
  }
}
