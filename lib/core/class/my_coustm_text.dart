import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class MyCoustomText extends StatelessWidget {
  final FontWeight weight;
  final double size;
  final String text;
  final TextAlign? textAlign;
  const MyCoustomText(
      {super.key,
      required this.text,
      required this.weight,
      required this.size,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          decoration: TextDecoration.none,
          color: AppColor.setWhiteAndBlack()),
    );
  }
}
