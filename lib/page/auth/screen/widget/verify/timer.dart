import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

class TimerText extends StatelessWidget {
  final int seconds;
  const TimerText({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.center,
        style: AppTheme.themeEnglish.textTheme.bodyMedium,
        TextSpan(children: [
          TextSpan(text: "youcan".tr),
          TextSpan(text: "${seconds}"),
          TextSpan(text: "seconds".tr),
        ]));
  }
}
