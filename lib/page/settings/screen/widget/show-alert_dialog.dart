import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';

AlertDialog buildAlertDialog(void Function()? onPressed) {
  return AlertDialog(
    title: const Text('Confirmation'),
    content: const Text(
      'Do you want to change your phone number?',
      style: TextStyle(fontSize: 16),
    ),
    actions: [
      TextButton(
        onPressed: onPressed,
        child: Text(
          'OK',
          style: TextStyle(color: AppColor.setWhiteAndBlack()),
        ),
      ),
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel',
            style: TextStyle(color: AppColor.setWhiteAndBlack())),
      ),
    ],
  );
}
