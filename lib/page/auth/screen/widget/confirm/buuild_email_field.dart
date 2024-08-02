import 'package:get/get.dart';

import 'package:indriveclone/core/function/valid_input.dart';
import 'package:indriveclone/core/shared/coustom_text_form_fireld.dart';
import 'package:indriveclone/page/auth/controller/confrim_controller.dart';

CoustomTextField buildEmailField(ConfrimController controller) {
  return CoustomTextField(
    validator: (val) {
      return validInput(2, 100, "email", val!);
    },
    controller: controller.emailController,
    isNumber: false,
    isEnable: false,
    hinttext: "email".tr,
  );
}
