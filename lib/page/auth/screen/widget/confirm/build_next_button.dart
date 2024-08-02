import 'package:flutter/src/widgets/basic.dart';
import 'package:indriveclone/page/auth/controller/confrim_controller.dart';
import 'package:indriveclone/shared/widgets/main_button.dart';

SizedBox buildNextButton(ConfrimController controller) {
  return SizedBox(
    height: 55,
    child: MyMainButton(
      onPressed: () {
        controller.goToVerifyPage();
      },
      title: "next",
    ),
  );
}
