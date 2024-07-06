import 'package:flutter/material.dart';

class ServicesIcon extends StatelessWidget {
  final String imagename;
  final String name;
  final Function() onTap;
  final Function() onLongPress;
  final int isActive;
  const ServicesIcon(
      {super.key,
      required this.imagename,
      required this.name,
      required this.onTap,
      required this.onLongPress,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // color: isActive == 1 ? const Color(0xff323943) : null,
        width: 100,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              "$name",
              height: 80,
              width: 80,
            ),
            Positioned(
              bottom: 8,
              left: 5,
              child: Text(
                imagename,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
