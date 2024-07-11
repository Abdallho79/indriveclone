import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/services/services.dart';
import 'package:indriveclone/page/home/controller/map_home_controller.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  MapHomeController mapController = Get.find();

  // Variables to store fare information
  String recommendedFare = "Recommended :  ";
  int fare = 0;
  double distance = 0;
  double time = 0;

  TextEditingController? fareController;

  // Variables to store the "from" and "to" locations
  bool? isClientFrom;
  double? fromLat;
  double? fromLong;
  String fromName = "";
  double? toLat;
  double? toLong;
  String toName = "";
  bool isAllSelected = false;

  


  // Navigate to the location selection screen and update the location in HomeController
  void goToChooseLocation(bool status) {
    isClientFrom = status;
    Get.toNamed(AppRoute.map, arguments: {"isClientFrom": isClientFrom})
        ?.then((value) {
      if (value != null) {
        setLocation(
            lat: value["lat"],
            long: value["long"],
            name: value["name"],
            isFrom: isClientFrom!);
      }
    });
  }

  // Navigate to the find driver screen with the necessary arguments
  void goToFindDriver() {
    Get.toNamed(AppRoute.finddriver, arguments: {
      "fromlat": fromLat,
      "fromlong": fromLong,
      "tolat": toLat,
      "tolong": toLong,
      "fare": fare,
    });
  }

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
      setIsAllSelected();
      mapController.addMarkers(lat, long, isFrom);
    } else {
      toLat = lat;
      toLong = long;
      toName = name;
      setIsAllSelected();
      mapController.addMarkers(lat, long, isFrom);
    }

    update();
  }

  // Check if both "from" and "to" locations are selected
  void setIsAllSelected() async {
    if (fromLong != null && toLong != null) {
      Map data = await mapController.drawPolyline(
          fromLat!, fromLong!, toLat!, toLong!);
      distance = data["distance"];
      time = data["duration"];
      fare = (distance * 5).toInt() <= 20 ? 20 : (distance * 5).toInt();
      isAllSelected = true;
    } else {
      isAllSelected = false;
    }
    update();
  }

  // Validate the fare and update the fare variable accordingly
  void validate() {
    if (fareController!.text.isNotEmpty) {
      if (20 <= int.parse(fareController!.text)) {
        fare = int.parse(fareController!.text);
        recommendedFare = "";
        Get.back();
        update();
      } else {
        recommendedFare = "Recommended :  ";
        update();
        Get.snackbar("Error", "Fare Can't be less than 20");
      }
    } else {
      recommendedFare = "Recommended :  ";
      Get.back();
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fareController = TextEditingController();
    // Set initial values in shared preferences
  }

  @override
  void dispose() {
    fareController!.dispose();
    super.dispose();
  }
}
