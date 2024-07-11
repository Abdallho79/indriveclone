import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';

class CoustomTextField extends StatelessWidget {
  final String? hinttext;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final bool? isNumber;
  final bool? isEnable;
  final Widget? suffix;
  const CoustomTextField(
      {super.key,
      required this.validator,
      required this.controller,
      required this.isNumber,
      required this.isEnable,
      required this.hinttext,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextFormField(
        enabled: (isEnable!),
        controller: controller,
        keyboardType: isNumber! ? TextInputType.number : TextInputType.text,
        validator: validator,
        cursorColor: Colors.white,
        style: isEnable!
            ? const TextStyle(fontSize: 16, color: Colors.white)
            : const TextStyle(fontSize: 16, color: AppColor.background_light),
        decoration: InputDecoration(
          suffix: suffix,
          filled: true,
          fillColor: isEnable!
              ? AppColor.objectbackground
              : const Color.fromARGB(255, 150, 151, 151),
          hintStyle: AppTheme.themeEnglish.textTheme.labelSmall,
          hintText: "$hinttext".tr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
