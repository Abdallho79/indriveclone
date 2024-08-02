import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/handling_status_request.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/page/history/data/local/histroy_in_city_model.dart';
import 'package:indriveclone/page/history/data/remote/histroy_in_city_data.dart';
import 'package:indriveclone/shared/mixin/google_map_services_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class HistoryController extends GetxController with CoustomGoogleMapMixIn {
  StatusRequest statusRequest = StatusRequest.none;
  HistroyInCityViewData histroyInCityViewData =
      HistroyInCityViewData(Get.find());
  List<Marker> markers = [];
  List<LatLng> polylineCoordinates = [];
  List<TravelInCityDetailsModel> data = [];
  Set<Polyline> polylines = {};
  List<List<Marker>> allMarkers = [];
  List<Set<Polyline>> allPolyLines = [];
  int offSet = 0;

  late String Date;

  changeStatusRequest(StatusRequest status) {
    statusRequest = status;
    update();
  }

  Future<void> getData() async {
    changeStatusRequest(StatusRequest.loading);
    var response = await histroyInCityViewData.findDriver(
        myServices.sharedPreferences.getString("id")!, 0, 20);
    statusRequest = handlingStatusRequestData(response);
    if (statusRequest != StatusRequest.success) {
      changeStatusRequest(statusRequest);
      return;
    }
    if (response['status'] == "success") {
      List responsedata = response["data"];
      PrintString("respnsedata", responsedata);
      data.addAll(
          responsedata.map((e) => TravelInCityDetailsModel.fromJson(e)));
      offSet += 10;
      for (int i = 0; i < data.length; i++) {
        addMarkers(i);
        drawPolyline(i);
        createTime(i);
        update();
      }
      changeStatusRequest(StatusRequest.success);
    } else {
      PrintString("fail", "fail");
      changeStatusRequest(StatusRequest.serverfailure);
    }
  }

  createTime(int index) {
    DateTime pastDate = DateTime.parse(data[index].travelStartTime!);
    Date = timeago.format(pastDate);
    PrintString("pastDate", timeago.format(pastDate));
  }

  void addMarkers(int index) async {
    if (index < 0 || index >= data.length) {
      PrintString("Error", "Index out of range");
      return;
    }
    List<Marker> localMarkers = [];
    localMarkers.add(
      Marker(
          markerId: const MarkerId("userfrom"),
          position:
              LatLng(data[index].travelFromLat!, data[index].travelFromLong!)),
    );
    localMarkers.add(
      Marker(
          markerId: const MarkerId("userto"),
          position:
              LatLng(data[index].travelToLat!, data[index].travelToLong!)),
    );
    allMarkers.add(localMarkers);
  }

  void drawPolyline(int index) {
    if (index < 0 || index >= data.length) {
      PrintString("Error", "Index out of range");
      return;
    }
    polylineCoordinates = [];
    polylineCoordinates.addAll([
      LatLng(data[index].travelFromLat!, data[index].travelFromLong!),
      LatLng(data[index].travelToLat!, data[index].travelToLong!),
    ]);
    Set<Polyline> polylines = {};
    polylines.add(Polyline(
      polylineId: PolylineId('$index'),
      visible: true,
      points: polylineCoordinates,
      color: Colors.blue,
      width: 4,
    ));
    allPolyLines.add(polylines);
    PrintString("AllPolyLine", allPolyLines.length);
  }

  void onMapCreated1(GoogleMapController controller, int index) {
    googleMapController = controller;
    super.loadMapStyles();
  }

  void goToDetails(int index) {
    Get.toNamed(AppRoute.rideDetails,
        arguments: {"selectedData": data[index], "date": Date});
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  onMapCreated(GoogleMapController controller) {
    // TODO: implement onMapCreated
    throw UnimplementedError();
  }
}
