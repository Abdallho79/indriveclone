import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/auth/controller/verify_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/otp_text.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/resend_button.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/text_appove.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/timer.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: GetBuilder<VerifyController>(
          builder: (controller) => ListView(
            padding: const EdgeInsets.all(15),
            children: [
              TextAppove(
                phonenumber: controller.phoneNumber,
              ),
              OtpText(
                onSubmit: (code) {
                  controller.onSubmit(code);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<VerifyController>(
                builder: (controller) =>
                    TimerText(seconds: controller.remainingSeconds),
              ),
              const SizedBox(
                height: 25,
              ),
              if (controller.resendCodeEnabled)
                GetBuilder<VerifyController>(
                    builder: (controller) => ResendButton(
                          onPressed: () {
                            controller.reSendCode();
                          },
                        )),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ));
  }
}
