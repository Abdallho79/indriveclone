import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class MyMainButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const MyMainButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            backgroundColor: WidgetStatePropertyAll(AppColor.green)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none),
        ));
  }
}
