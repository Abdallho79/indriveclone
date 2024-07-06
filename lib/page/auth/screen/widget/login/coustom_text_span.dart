import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

class CoustomTextSpan extends StatelessWidget {
  const CoustomTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "joining".tr,
              style: AppTheme.themeEnglish.textTheme.labelMedium,
            ),
            TextSpan(
              text: "termsofuse".tr,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle terms of use tap
                  print("Terms of Use tapped");
                },
            ),
            TextSpan(
              text: "and".tr,
              style: AppTheme.themeEnglish.textTheme.labelMedium,
            ),
            TextSpan(
              text: "privcy".tr,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle privacy tap
                  print("Privacy of Use tapped");
                },
            ),
          ],
        ),
      ),
    );
  }
}