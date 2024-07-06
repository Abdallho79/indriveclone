import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';
import 'package:indriveclone/page/auth/controller/confrim_controller.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CoustomTextFieldPhoneEmail extends GetView<ConfrimController> {
  const CoustomTextFieldPhoneEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InternationalPhoneNumberInput(
        cursorColor: Colors.black,
        searchBoxDecoration: InputDecoration(
          labelText: "Search by Countery Key or Name",
          labelStyle: TextStyle(
            fontSize: 20,
          ),
        ),
        textStyle: TextStyle(
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
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          showFlags: true,
          useEmoji: false,
          setSelectorButtonAsPrefixIcon: false,
        ),
        ignoreBlank: true,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        initialValue: PhoneNumber(isoCode: 'US'),
        textFieldController: TextEditingController(),
        formatInput: false,
        keyboardType:
            TextInputType.numberWithOptions(signed: true, decimal: true),
        onInputChanged: (PhoneNumber number) {
          print("=======================================");
          print(number.phoneNumber);
          controller.phoneNumber = number.phoneNumber;
        },
        onInputValidated: (bool value) {
          controller.isNumberTrue = value;
          print(value);
        },
      ),
    );
  }
}
