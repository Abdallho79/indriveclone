import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class LoginButton extends StatelessWidget {
    final void Function() onTap;
  final String keytitle;
  const LoginButton({super.key, required this.onTap, required this.keytitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColor.green, borderRadius: BorderRadius.circular(15)),
        child: Text(
          keytitle.tr,
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
