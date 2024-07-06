import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class BottomSheetButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const BottomSheetButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.green, // لون الزر الأخضر
        minimumSize: const Size(double.infinity, 50), // زر ممتد بعرض الشاشة
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
      ),
    );
  }
}
