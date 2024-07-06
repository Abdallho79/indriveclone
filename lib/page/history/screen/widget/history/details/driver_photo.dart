import 'package:flutter/material.dart';

class DriverPhoto extends StatelessWidget {
  final String imagePath;
  final String driverName;
  const DriverPhoto(
      {super.key, required this.imagePath, required this.driverName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
            )),
        const SizedBox(
          height: 8,
        ),
        Text(driverName, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
