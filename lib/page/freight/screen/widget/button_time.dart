import 'package:flutter/material.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class TimeElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final int isActive;
  final int isActivenumber;
  const TimeElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.isActive,
      required this.isActivenumber});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(isActive == isActivenumber
                ? AppColor.setIsActiveLightColor()
                : AppColor.setBackGrounColor()),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)))),
        onPressed: onPressed,
        child: MyCoustomText(
            text: text,
            weight: FontWeight.bold,
            size: 14,
            textAlign: TextAlign.center));
  }
}
