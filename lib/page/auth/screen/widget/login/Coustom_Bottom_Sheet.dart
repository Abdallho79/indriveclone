import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

ShowWhatsSMS(
    void Function()? onPressedWhatsApp, void Function()? onPressedSMS) {
  Get.bottomSheet(
      backgroundColor: AppColor.background_dark,
      Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "howwould".tr,
              style: AppTheme.themeEnglish.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            TextButton.icon(
              onPressed: onPressedSMS,
              label: Text(
                "SMS",
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
              icon: Icon(Icons.sms, color: Colors.white),
            ),
            TextButton.icon(
              onPressed: onPressedWhatsApp,
              label: Text(
                "WhatsApp",
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
              icon: Icon(
                Icons.whatshot_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ));
}
