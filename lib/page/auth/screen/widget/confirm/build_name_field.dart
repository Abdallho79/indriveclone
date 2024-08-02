import 'package:get/get.dart';
import 'package:indriveclone/core/function/valid_input.dart';
import 'package:indriveclone/core/shared/coustom_text_form_fireld.dart';
import 'package:indriveclone/page/auth/controller/confrim_controller.dart';


CoustomTextField buildNameField(ConfrimController controller) {
  return CoustomTextField(
    validator: (val) {
      return validInput(2, 50, "text", val!);
    },
    controller: controller.nameController,
    isNumber: false,
    isEnable: true,
    hinttext: "name".tr,
  );
}
