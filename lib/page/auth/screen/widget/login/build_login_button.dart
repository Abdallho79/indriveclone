import 'package:flutter/material.dart';
import 'package:indriveclone/page/auth/controller/login_controller.dart';
import 'package:indriveclone/shared/widgets/main_button.dart';

SizedBox buildLoginButton(LoginController controller) {
  return SizedBox(
    height: 55,
    child: MyMainButton(
        onPressed: () {
          controller.goToVerifyPage();
        },
        title: 'Next'),
  );
}
