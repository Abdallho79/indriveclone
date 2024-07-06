import 'package:flutter/material.dart';

class MyHeight extends StatelessWidget {
  final double height;
  const MyHeight({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
