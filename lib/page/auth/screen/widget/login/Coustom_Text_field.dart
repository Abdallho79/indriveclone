import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';
import 'package:indriveclone/page/auth/controller/login_controller.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CoustomTextFieldPhoneLgin extends GetView<LoginController> {
  const CoustomTextFieldPhoneLgin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InternationalPhoneNumberInput(
        cursorColor: Colors.white,
        searchBoxDecoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          filled: true,
          counterStyle: TextStyle(color: Colors.red),
          fillColor: AppColor.background_light,
          focusColor: Colors.black,
          labelText: "Search by Country Key or Name",
          labelStyle: TextStyle(fontSize: 20, color: AppColor.background_dark),
        ),
        textStyle: TextStyle(
          // number which user will enter number
          color: Colors.white,
          fontSize: 20,
        ),
        inputDecoration: InputDecoration(
          filled: true,
          fillColor: AppColor.objectbackground,
          hintStyle: AppTheme.themeEnglish.textTheme.labelSmall,
          hintText: "phone".tr,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        selectorConfig: SelectorConfig(
          useBottomSheetSafeArea: true,
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          showFlags: true,
          useEmoji: false,
          setSelectorButtonAsPrefixIcon: false,
        ),
        ignoreBlank: true,
        autoValidateMode: AutovalidateMode.disabled,
        // style key number
        selectorTextStyle: TextStyle(
            color: Colors.white, fontSize: 16, decoration: TextDecoration.none),
        initialValue: PhoneNumber(isoCode: 'US'),
        textFieldController: TextEditingController(),
        formatInput: false,
        keyboardType:
            TextInputType.numberWithOptions(signed: true, decimal: true),
        onInputChanged: (PhoneNumber number) {
          print(number.dialCode); // هنا يتم طباعة مفتاح الدولة
          print(number
              .phoneNumber); // هنا يتم طباعة الرقم الهاتف بدون مفتاح الدولة
          controller.phoneNumber = number.phoneNumber;
          controller.phoneKey = number.dialCode;
        },
        onInputValidated: (bool value) {
          controller.isPhoneNumberTrue = value;
          print(value);
        },
      ),
    );
  }
}
