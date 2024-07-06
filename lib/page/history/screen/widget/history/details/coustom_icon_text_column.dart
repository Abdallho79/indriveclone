import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class CoustomIconTextColumn extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData iconData;
  const CoustomIconTextColumn(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.green)),
            iconSize: 35,
            onPressed: onPressed,
            icon: Icon(iconData)),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
