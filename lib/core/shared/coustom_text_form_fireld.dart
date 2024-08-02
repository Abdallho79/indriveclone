import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';

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
        cursorColor: AppColor.setCoursorColor(),
        enabled: (isEnable!),
        controller: controller,
        keyboardType: isNumber! ? TextInputType.number : TextInputType.text,
        validator: validator,
        style: TextStyle(fontSize: 16, color: AppColor.setTextColor()),
        decoration: InputDecoration(
          suffix: suffix,
          filled: true,
          fillColor: AppColor.setBackGrounColor(),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          hintText: "$hinttext".tr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.setBackGrounColor()),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.setBackGrounColor()),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.setBackGrounColor()),
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
