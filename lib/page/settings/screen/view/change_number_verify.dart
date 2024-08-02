import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/otp_text.dart';
import 'package:indriveclone/page/auth/screen/widget/verify/text_appove.dart';
import 'package:indriveclone/page/settings/controller/change_mobile_number_controller.dart';

class ChangePhoneVerifyView extends StatelessWidget {
  const ChangePhoneVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangeMobileNumberController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ChangeMobileNumberController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          onRefresh: controller.isThereInternet,
          widget: _buildListView(controller),
        ),
      ),
    );
  }

  ListView _buildListView(ChangeMobileNumberController controller) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        _buildTextApprove(controller),
        const SizedBox(height: 20),
        _buildOtpText(controller),
      ],
    );
  }

  Widget _buildTextApprove(ChangeMobileNumberController controller) {
    return TextAppove(
      phonenumber: controller.phoneNumber,
    );
  }

  Widget _buildOtpText(ChangeMobileNumberController controller) {
    return OtpText(
      onSubmit: (code) {
        controller.onSubmit(code);
      },
    );
  }
}
