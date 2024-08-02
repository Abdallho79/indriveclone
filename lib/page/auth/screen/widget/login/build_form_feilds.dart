import 'package:flutter/material.dart';
import 'package:indriveclone/core/function/valid_input.dart';
import 'package:indriveclone/core/shared/coustom_text_form_fireld.dart';
import 'package:indriveclone/page/auth/controller/login_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/login/coustom_text_field.dart';
 
Column buildFormFields(LoginController controller) {
  return Column(
    children: [
      CoustomTextField(
        validator: (val) {
          return validInput(2, 30, "text", val!);
        },
        controller: controller.nameController,
        isNumber: false,
        isEnable: true,
        hinttext: 'Enter your name',
        
      ),
      const SizedBox(height: 15),
      const CoustomTextFieldPhoneLgin(),
      const SizedBox(height: 30),
    ],
  );
}
