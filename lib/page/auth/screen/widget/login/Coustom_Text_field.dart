import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/auth/controller/login_controller.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CoustomTextFieldPhoneLgin extends GetView<LoginController> {
  const CoustomTextFieldPhoneLgin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      cursorColor: Colors.black,
      searchBoxDecoration: InputDecoration(
        labelText: "Search by Countery Key or Name",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.setBackGrounColor()),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.setBackGrounColor()),
        ),
        filled: true,
      ),

      textStyle: const TextStyle(
        fontSize: 20,
      ),
      inputDecoration: InputDecoration(
        filled: true,
        fillColor: AppColor.setBackGrounColor(),
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.setTextColor()),
        hintText: "phone".tr,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.setBackGrounColor()),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.setBackGrounColor()),
        ),
      ),
      selectorConfig: const SelectorConfig(
        useBottomSheetSafeArea: true,
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        showFlags: true,
        useEmoji: false,
        setSelectorButtonAsPrefixIcon: false,
      ),
      ignoreBlank: true,
      autoValidateMode: AutovalidateMode.disabled,
      // style key number
      selectorTextStyle:
          const TextStyle(fontSize: 16, decoration: TextDecoration.none),
      initialValue: PhoneNumber(isoCode: 'EG'),
      textFieldController: TextEditingController(),
      formatInput: false,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      onInputChanged: (PhoneNumber number) {
        controller.phoneNumber = number.phoneNumber;
        // controller.phoneKey = number.dialCode;
      },
      onInputValidated: (bool value) {
        controller.isPhoneNumberTrue = value;
      },
    );
  }
}
