import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/constant/theme_app.dart';
import 'package:indriveclone/core/function/google_signin.dart';
import 'package:indriveclone/core/function/valid_input.dart';
import 'package:indriveclone/core/shared/coustom_text_form_fireld.dart';
import 'package:indriveclone/page/auth/controller/login_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/login/coustom_text_field.dart';
import 'package:indriveclone/page/auth/screen/widget/login/coustom_text_span.dart';
import 'package:indriveclone/page/auth/screen/widget/login/login_button.dart';
import 'package:indriveclone/page/auth/screen/widget/login/social_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.background_dark,
      body: GetBuilder<LoginController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formstate,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: Get.height / 5),
                            Center(
                              child: Text(
                                "join_us".tr,
                                style:
                                    AppTheme.themeEnglish.textTheme.bodyLarge,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "we'll".tr,
                              style: AppTheme.themeEnglish.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 25),
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
                            LoginButton(
                              onTap: () {
                                controller.goToVerifyPage();
                              },
                              keytitle: 'Next',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "or".tr,
                                style:
                                    AppTheme.themeEnglish.textTheme.labelMedium,
                              ),
                            ),
                            SocialButton(
                              onTap: () async {
                               await controller.logInWithGoogle();
                              },
                              keytitle: "google",
                              image: AppImage.google,
                              height55facebook45googlr: 45,
                            ),
                            const SizedBox(height: 15),
                            const CoustomTextSpan(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onRefresh: controller.isThereInternet,
              )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColor.objectbackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintStyle: AppTheme.themeEnglish.textTheme.labelSmall,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
