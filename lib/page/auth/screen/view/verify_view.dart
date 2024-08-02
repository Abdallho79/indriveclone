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
      appBar: AppBar(),
      body: GetBuilder<VerifyController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          onRefresh: controller.isThereInternet,
          widget: _buildListView(controller),
        ),
      ),
    );
  }

  ListView _buildListView(VerifyController controller) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        _buildTextApprove(controller),
        const SizedBox(height: 20),
        _buildOtpText(controller),
      ],
    );
  }

  Widget _buildTextApprove(VerifyController controller) {
    return TextAppove(
      phonenumber: controller.phoneNumber,
    );
  }

  Widget _buildOtpText(VerifyController controller) {
    return OtpText(
      onSubmit: (code) {
        controller.onSubmit(code);
      },
    );
  }
}
