import 'package:flutter/material.dart';
import 'package:get/get.dart';

Center buildHeader() {
  return Center(
    child: Text(
      "Confrim your information".tr,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
