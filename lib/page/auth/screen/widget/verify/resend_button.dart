import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

class ResendButton extends StatelessWidget {
  final void Function() onPressed;
  const ResendButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                vertical: 15.0,
              ),
            ),
            backgroundColor:
                WidgetStateProperty.all(AppColor.background_light)), // ,
        onPressed: onPressed,
        child: Text(
          "ResendCode".tr,
          style: AppTheme.themeEnglish.textTheme.bodyMedium,
        ));
  }
}
