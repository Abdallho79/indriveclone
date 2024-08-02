import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'dart:ui' as ui;

import 'package:indriveclone/core/services/services.dart';

mixin CoustomGoogleMapMixIn {
  CameraPosition? initialPosition;
  GoogleMapController? googleMapController;
  MyServices myServices = Get.find();
  String? darkMapStyle;

  late Uint8List customMarker;

  setCoustomIconn(int type) async {
    customMarker = await getBytesFromAsset(
        type == 1
            ? AppImage.markerfrom
            : type == 2
                ? AppImage.markerto
                : AppImage.markerdriver, //paste the custom image path
        70 // size of custom image as marker
        );
  }

  onMapCreated(GoogleMapController controller);

  // Load dark map style from assets
  Future<void> loadMapStyles() async {
    if (myServices.sharedPreferences.getString("theme") == "light") {
      return;
    }
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    googleMapController!.setMapStyle(darkMapStyle);
  }

  // Example method, replace with your logic
  void getCurrentLocation() {}

  // Example method, replace with your logic
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
