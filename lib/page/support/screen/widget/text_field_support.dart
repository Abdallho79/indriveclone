import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

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
    return Container(
      height: 40,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 16, color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.objectbackground,
          hintStyle: AppTheme.themeEnglish.textTheme.labelSmall,
          hintText: hinttext,
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

