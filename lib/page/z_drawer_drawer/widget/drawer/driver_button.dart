import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class ButtonDriverMode extends StatelessWidget {
  final void Function() onPressed;
  const ButtonDriverMode({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 60,
        width: Get.width,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            backgroundColor: WidgetStatePropertyAll(AppColor.green),
          ),
          onPressed: onPressed,
          child: MyCoustomText(
            text: 'Driver Mode',
            color: Colors.black,
            weight: FontWeight.normal,
            size: 26,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
