import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class CoustomTextIconRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  const CoustomTextIconRow(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(color: AppColor.setTextColor(), fontSize: 16),
          )
        ],
      ),
    );
  }
}
