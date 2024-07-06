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
import 'package:indriveclone/page/auth/screen/widget/login/Coustom_Text_field.dart';
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
                widget: controller.onboarding
                    ? Image.asset(
                        AppImage.onboarding,
                        height: Get.height,
                        width: Get.width,
                      )
                    : Form(
                        key: controller.formstate,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
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
                                      style: AppTheme
                                          .themeEnglish.textTheme.bodyLarge,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "we'll".tr,
                                    style: AppTheme
                                        .themeEnglish.textTheme.bodyMedium,
                                  ),
                                  SizedBox(height: 25),
                                  CoustomTextField(
                                    validator: (val) {
                                      return validInput(2, 30, "text", val!);
                                    },
                                    controller: controller.nameController,
                                    isNumber: false,
                                    isEnable: true,
                                    hinttext: 'Enter your name',
                                  ),
                                  SizedBox(height: 15),
                                  CoustomTextFieldPhoneLgin(),
                                  SizedBox(height: 30),
                                  LoginButton(
                                    onTap: () {
                                      controller.isLoadingStatusRequest();

                                      controller.isGoogleLogin = false;
                                      controller.goToVerifyPage();
                                      controller.doneLoadingStatusRequest();
                                    },
                                    keytitle: 'Next',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Text(
                                      "or".tr,
                                      style: AppTheme
                                          .themeEnglish.textTheme.labelMedium,
                                    ),
                                  ),
                                  SocialButton(
                                    onTap: () async {
                                      controller.isLoadingStatusRequest();
                                      Map? _userData = await signInWithGoogle();
                                      if (_userData != null) {
                                        controller.isGoogleLogin = true;
                                        controller.setUserData(_userData);
                                        controller.doneLoadingStatusRequest();
                                      }
                                      controller.doneLoadingStatusRequest();
                                    },
                                    keytitle: "google",
                                    image: AppImage.google,
                                    height55facebook45googlr: 45,
                                  ),
                                  SizedBox(height: 15),
                                  CoustomTextSpan(),
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
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
  }) : super(key: key);

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
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
