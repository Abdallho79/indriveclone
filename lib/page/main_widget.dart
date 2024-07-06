import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class TheMainWidget extends StatelessWidget {
  final void Function() onPressed;
  final String inputText;
  final String staticText;
  const TheMainWidget(
      {super.key,
      required this.onPressed,
      required this.inputText,
      required this.staticText});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 55,
      onPressed: onPressed,
      color: AppColor.background_light,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (inputText.isNotEmpty && inputText != "0")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyCoustomText(
                    text: "$staticText",
                    color: Colors.grey[500],
                    weight: FontWeight.normal,
                    size: 14,
                    textAlign: TextAlign.start),
                Container(
                  constraints: BoxConstraints(maxWidth: Get.width - 90),
                  child: MyCoustomText(
                      text: "$inputText",
                      color: Colors.white,
                      weight: FontWeight.normal,
                      size: 18,
                      textAlign: TextAlign.start),
                ),
              ],
            ),
          if (inputText.isEmpty || inputText == "0")
            MyCoustomText(
                text: "$staticText",
                color: Colors.grey[500],
                weight: FontWeight.normal,
                size: 16,
                textAlign: TextAlign.start),
          Icon(
            Icons.skip_next,
            size: 30,
            color: Colors.grey[500],
          )
        ],
      ),
    );
  }
}
