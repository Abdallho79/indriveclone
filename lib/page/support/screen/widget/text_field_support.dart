import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class CoustomTextFieldSupport extends StatelessWidget {
  final String? hinttext;
  final TextEditingController? controller;
  const CoustomTextFieldSupport({
    super.key,
    required this.controller,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.setBackGrounColor(),
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[400]),
          hintText: hinttext,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(),
          ),
        ),
      ),
    );
  }
}
