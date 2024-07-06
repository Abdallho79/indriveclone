import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

class TextAppove extends StatelessWidget {
  final String? phonenumber;
  const TextAppove({super.key, required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "entercode".tr,
          style: AppTheme.themeEnglish.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "wehavesent".tr,
          style: AppTheme.themeEnglish.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${phonenumber}",
          style: AppTheme.themeEnglish.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
