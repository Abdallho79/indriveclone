import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/page/auth/controller/verify_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/otp_text.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/text_appove.dart';

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
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  onRefresh: controller.isThereInternet,
                  widget: ListView(
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
                    ],
                  ),
                )));
  }
}
