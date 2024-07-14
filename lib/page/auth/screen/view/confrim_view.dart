import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';
import 'package:indriveclone/core/function/valid_input.dart';
import 'package:indriveclone/core/shared/coustom_text_form_fireld.dart';
import 'package:indriveclone/page/auth/controller/confrim_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/add_photo.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/phone.dart';
import 'package:indriveclone/page/auth/screen/widget/login/login_button.dart';

class ConfrimView extends StatelessWidget {
  const ConfrimView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConfrimController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          elevation: 0,
        ),
        backgroundColor: AppColor.background_dark,
        body: GetBuilder<ConfrimController>(
            builder: (controller) => Form(
                  key: controller.formstate,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Confrim your information".tr,
                              style: AppTheme.themeEnglish.textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                             AddPhoto(),
                            const SizedBox(
                              height: 20,
                            ),
                            CoustomTextField(
                                validator: (val) {
                                  return validInput(2, 50, "name", val!);
                                },
                                controller: controller.nameController,
                                isNumber: false,
                                isEnable: true,
                                hinttext: "name".tr),
                            const SizedBox(
                              height: 10,
                            ),
                            CoustomTextField(
                                validator: (val) {
                                  return validInput(2, 100, "email", val!);
                                },
                                controller: controller.emailController,
                                isNumber: false,
                                isEnable: false,
                                hinttext: "email".tr),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CoustomTextFieldPhoneEmail(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            LoginButton(
                                onTap: () {
                                  controller.goToVerifyPage();
                                },
                                keytitle: "next"),
                          ],
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
