import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/shared/mixin/google_map_services_controller.dart';

class MyGoogleMapChosseLocationController extends GetxController
    with CoustomGoogleMapMixIn {
  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];
  bool isTimerRunning = false;
  List<Placemark>? placemarks;
  LatLng? latlng;
  String? localityname;

  addMarkers(double lat, double long) {
    markers.add(
        Marker(markerId: const MarkerId("1"), position: LatLng(lat, long)));
    if (markers.length > 3) {
      markers.removeAt(2);
    }
    update();
  }

  getLocationDetails(LatLng location) async {
    latlng = location;
    addMarkers(location.latitude, location.longitude);

    placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    Placemark place = placemarks![0];

    if (placemarks!.isNotEmpty) {
      localityname = place.locality;
    }
  }

  goToHome() {
    if (localityname != null) {
      Get.back(result: {
        "lat": latlng!.latitude,
        "long": latlng!.longitude,
        "name": localityname,
      });
    }
  }

  @override
  getCurrentLocation() {
    initialPosition = CameraPosition(
        target: LatLng(myServices.sharedPreferences.getDouble("lat")!,
            myServices.sharedPreferences.getDouble("long")!),
        zoom: 14);
  }

  changeStatusRequset(StatusRequest status) {
    statusRequest = status;
    update();
  }

  @override
  onMapCreated(GoogleMapController controller) {
    changeStatusRequset(StatusRequest.loading);
    googleMapController = controller;
    changeStatusRequset(StatusRequest.success);
    loadMapStyles();
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}
