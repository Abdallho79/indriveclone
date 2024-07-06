import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class BottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const BottomButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.green, // لون الزر الأخضر
        minimumSize: Size(double.infinity, 50), // زر ممتد بعرض الشاشة
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
      ),
    );
  }
}
