import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class TextAppove extends StatelessWidget {
  final String? phonenumber;
  const TextAppove({super.key, required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "entercode".tr,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "wehavesent".tr,
          style: TextStyle(
              fontSize: 18,
              color: AppColor.setTextColor(),
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$phonenumber",
          style: TextStyle(
              fontSize: 18,
              color: AppColor.setTextColor(),
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
