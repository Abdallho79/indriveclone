import 'dart:async';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';

mixin CoustomGoogleMap {
  CameraPosition? initialPosition;
  Completer<GoogleMapController>? googleMapController;
  String? darkMapStyle;

  void onMapCreated(GoogleMapController controller) {
    if (!googleMapController!.isCompleted) {
      googleMapController!.complete(controller);
    }
  }

  // Load dark map style from assets
  Future loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    final controller = await googleMapController!.future;
    // ignore: deprecated_member_use
    controller.setMapStyle(darkMapStyle);
  }
}
