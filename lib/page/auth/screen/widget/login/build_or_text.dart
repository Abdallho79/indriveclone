import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';

Padding buildOrText() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Text(
      "or".tr,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.setTextColor(),
          ),
      textAlign: TextAlign.center,
    ),
  );
}
