import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';

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
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.setTextColor(),
              ),
            ),
            TextSpan(
              text: "termsofuse".tr,
              style: const TextStyle(
                  fontSize: 14,
                  color: AppColor.green,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: "and".tr,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.setTextColor(),
              ),
            ),
            TextSpan(
              text: "privcy".tr,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: AppColor.green),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
