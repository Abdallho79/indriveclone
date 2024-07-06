// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/constant/rout_app.dart';

class HistoryController extends GetxController {
  // قائمة تفاصيل الركوب
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
  ];

  // عنصر التحكم في خرائط جوجل
  Completer<GoogleMapController>? googleMapController;

  // علامات الخرائط
  List<Marker> markers = [];

  // إحداثيات الخطوط المتعددة
  List<LatLng> polylineCoordinates = [];

  // مجموعة الخطوط المتعددة
  Set<Polyline> polylines = {};

  // أسلوب الخريطة الداكنة
  String? darkMapStyle;

  // تحميل أسلوب الخريطة
  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(AppImage.darkmabtheme);
    final controller = await googleMapController!.future;
    controller.setMapStyle(darkMapStyle);
  }

  // الانتقال إلى تفاصيل الركوب
  void goToDetials() {
    Get.toNamed(AppRoute.rideDetails);
  }

  // الموقع الافتراضي للكاميرا
  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(31.024054, 31.417328),
    zoom: 12.56,
  );

  @override
  void onInit() {
    super.onInit();
    googleMapController = Completer<GoogleMapController>();
    _addMarkers();
    _drawPolyline();
    _loadMapStyles(); // تحميل أسلوب الخريطة عند التهيئة
  }

  // إضافة العلامات إلى الخريطة
  void _addMarkers() {
    markers.addAll([
      const Marker(
        markerId: MarkerId("1"),
        position: LatLng(31.024054, 31.417328),
        infoWindow: InfoWindow(title: "Marker 1"),
      ),
      const Marker(
        markerId: MarkerId("2"),
        position: LatLng(31.030000, 31.420000),
        infoWindow: InfoWindow(title: "Marker 2"),
      ),
    ]);

    // تحديث الحالة بعد إضافة العلامات
    update();
  }

  // رسم الخطوط المتعددة على الخريطة
  void _drawPolyline() {
    polylineCoordinates.addAll([
      const LatLng(31.024054, 31.417328),
      const LatLng(31.030000, 31.420000),
    ]);

    polylines.add(Polyline(
      polylineId: const PolylineId('polyline_1'),
      visible: true,
      points: polylineCoordinates,
      color: Colors.blue,
      width: 4,
    ));

    // تحديث الحالة بعد إضافة الخطوط المتعددة
    update();
  }

  // التعامل مع إنشاء الخريطة
  void onMapCreated(GoogleMapController controller) {
    if (!googleMapController!.isCompleted) {
      googleMapController!.complete(controller);
    }
  }
}
