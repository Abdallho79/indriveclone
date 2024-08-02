import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';

Column buildHeaderSection() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: Get.height / 5),
      Center(
        child: Text(
          "join_us".tr,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 15),
      Text(
        "we'll".tr,
        style: TextStyle(
            fontSize: 18,
            color: AppColor.setTextColor(),
            fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 25),
    ],
  );
}
