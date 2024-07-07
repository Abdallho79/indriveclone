import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/polyline.dart';

class FindDriverController extends GetxController {
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(31.024054, 31.417328), zoom: 14.45);
  String? darkMapStyle;
  Completer<GoogleMapController>? googleMapController;
  Set<Polyline> polylineSet = {};
  double? distance;
  double? time;
  List<Marker> markers = [];
  Map selecteddriver = {};

  int? fare;
  double? fromLat;
  double? fromLong;
  double? toLat;
  double? toLong;
  void onMapCreated(GoogleMapController controller) {
    if (!googleMapController!.isCompleted) {
      googleMapController!.complete(controller);
      controller.getZoomLevel();
    }
  }

  void selectedDriver(int index) {
    selecteddriver = workers[index];
  }

  void addMarkers() {
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId("userfrom"),
        position: LatLng(fromLat!, fromLong!)));

    markers.add(Marker(
        markerId: const MarkerId("userto"), position: LatLng(toLat!, toLong!)));
    for (var worker in workers) {
      markers.add(Marker(
        markerId: MarkerId(worker["name"]),
        position: LatLng(worker["latitude"], worker["longitude"]),
        infoWindow: InfoWindow(
          title: worker["name"],
          snippet: worker["carBrand"],
        ),
      ));
    }
  }

  // تحميل أسلوب الخريطة المظلم
  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    final controller = await googleMapController!.future;
    // ignore: deprecated_member_use
    controller.setMapStyle(darkMapStyle);
  }

  initPolyLine() async {
    Map<String, dynamic>? data =
        await getPolyLine(fromLat!, fromLong!, toLat!, toLong!, "user_line");
    await Future.delayed(const Duration(seconds: 1));
    polylineSet = data!["polylines"];
    distance = data["distance"];
    time = data["duration"];
    print("====================================");
    print(time);
    print("====================================");

    update();
  }

  @override
  void onInit() {
    googleMapController = Completer<GoogleMapController>();
    // fare = Get.arguments["fare"];
    // toLat = Get.arguments["tolat"];
    // toLong = Get.arguments["tolong"];
    // fromLat = Get.arguments["fromlat"];
    // fromLong = Get.arguments["fromlong"];

    fare = 29;
    toLat = 31.024409;
    toLong = 31.399975;
    fromLat = 31.024054;
    fromLong = 31.417328;

    super.onInit();

    addMarkers();
    _loadMapStyles();
    initPolyLine();
  }

  goToTrackingView() {
    // Get.offAllNamed(AppRoute.trackingtohome, arguments: {
    //   "userfromlat": fromLat,
    //   "userfromlong": fromLong,
    //   "usertolat": toLat,
    //   "usertolong": toLong,
    //   "driverfromlat": selecteddriver["latitude"],
    //   "driverfromlong": selecteddriver["longitude"],
    //   "polylinefromtouser": polylineSet,
    //   "distanceusertohome": distance,
    //   "timeusertohome": time,
    // });

    if (time != null) {
      Get.offAllNamed(AppRoute.trackingtohome, arguments: {
        "userfromlat": 31.024021,
        "userfromlong": 31.416705,
        "usertolat": 31.024409,
        "usertolong": 31.399975,
        "driverfromlat": 31.028583,
        "driverfromlong": 31.411350,
        "polylinefromtouser": polylineSet,
        "distanceusertohome": distance,
        "timeusertohome": time,
      });
    }
  }

  List<Map<String, dynamic>> workers = [
    {
      "name": "Wael Salah",
      "distance": "70 meters",
      "carBrand": "Mercedes 2019",
      "offer": 28,
      "avatar": AppImage.avatar,
      "latitude": 31.028583,
      "longitude": 31.411350
    },
    {
      "name": "Ahmed Ali",
      "distance": "50 meters",
      "carBrand": "BMW 2020",
      "offer": 30,
      "avatar": AppImage.avatar,
      "latitude": 30.045420,
      "longitude": 31.236712
    },
    {
      "name": "Mohamed Hassan",
      "distance": "100 meters",
      "carBrand": "Toyota 2018",
      "offer": 25,
      "avatar": AppImage.avatar,
      "latitude": 30.046420,
      "longitude": 31.237712
    },
  ];
}
