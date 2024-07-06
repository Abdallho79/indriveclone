import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

class SocialButton extends StatelessWidget {
  final void Function() onTap;
  final String keytitle;
  final String image;
  final double height55facebook45googlr;

  const SocialButton(
      {super.key,
      required this.onTap,
      required this.keytitle,
      required this.image,
      required this.height55facebook45googlr});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColor.background_light,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: height55facebook45googlr,
            ),
            Text(
              keytitle.tr,
              style: AppTheme.themeEnglish.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
