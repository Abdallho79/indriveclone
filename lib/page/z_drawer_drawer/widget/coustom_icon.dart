import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class CoustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  const CoustomIconButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
      ),
      style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(AppColor.setBackGrounColor())),
    );
  }
}
