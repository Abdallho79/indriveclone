import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class IconTest extends StatelessWidget {
  const IconTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => GoogleMapWidget(controller),
      ),
    );
  }
}

class HomeController extends GetxController {
  BitmapDescriptor? customIcon;
  Set<Marker> markers = {};

  @override
  void onInit() {
    super.onInit();
    createMarker();
  }

  void createMarker() {
    if (customIcon == null) {
      // Check if there's a valid context available
      final BuildContext? context = Get.context;
      if (context != null) {
        ImageConfiguration configuration =
            createLocalImageConfiguration(context);
        BitmapDescriptor.fromAssetImage(configuration, 'assets/fd.png')
            .then((icon) {
          customIcon = icon;
          update(); // Update GetBuilder after setting the icon
        });
      }
    }
  }

  void addMarker(LatLng position) {
    Marker m = Marker(
      markerId: MarkerId('${markers.length + 1}'),
      icon: customIcon!,
      position: position,
    );
    markers.add(m);
    update(); // Update GetBuilder when adding a new marker
  }
}

class GoogleMapWidget extends StatelessWidget {
  final HomeController controller;

  const GoogleMapWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: controller.markers,
      onTap: controller.addMarker,
      onMapCreated: (GoogleMapController controller) {},
      initialCameraPosition:
          const CameraPosition(target: LatLng(36.98, -121.99), zoom: 18),
    );
  }
}
