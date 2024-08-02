import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/page/history/data/local/histroy_in_city_model.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import 'package:indriveclone/shared/mixin/google_map_services_controller.dart';

class RideDetailsController extends GetxController with CoustomGoogleMapMixIn {
  late TravelInCityDetailsModel data;
  late Set<Polyline> polylines = {};
  late List<LatLng> polylineCoordinates = [];
  late List<Marker> markers = [];
  late String date;

  void goToReciper() {
    Get.toNamed(AppRoute.viewReicipe);
  }

  void goToSupport() {
    Get.find<MyDrawerController>().isActive = 6;
    Get.offAllNamed(
      AppRoute.support,
    );
  }

  void addMarkers() async {
    markers.add(
      Marker(
          markerId: const MarkerId("userfrom"),
          position: LatLng(data.travelFromLat!, data.travelFromLong!)),
    );
    markers.add(
      Marker(
          markerId: const MarkerId("userto"),
          position: LatLng(data.travelToLat!, data.travelToLong!)),
    );
  }

  void drawPolyline() {
    polylineCoordinates.addAll([
      LatLng(data.travelFromLat!, data.travelFromLong!),
      LatLng(data.travelToLat!, data.travelToLong!),
    ]);
    polylines.add(Polyline(
      polylineId: const PolylineId('1'),
      visible: true,
      points: polylineCoordinates,
      color: Colors.blue,
      width: 4,
    ));
  }

  @override
  void onInit() {
    data = Get.arguments["selectedData"];
    date = Get.arguments["date"];
    initialCameraPosition();
    addMarkers();
    drawPolyline();
    super.onInit();
  }

  initialCameraPosition() {
    initialPosition = CameraPosition(
        target: LatLng(data.travelFromLat!, data.travelFromLong!), zoom: 14);
  }

  @override
  onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }
}
