import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/auth/controller/confrim_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/add_photo.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/build_header.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/build_name_field.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/build_next_button.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/buuild_email_field.dart';
import 'package:indriveclone/page/auth/screen/widget/confirm/phone.dart';

class ConfrimView extends StatelessWidget {
  const ConfrimView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConfrimController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ConfrimController>(
        builder: (controller) => Form(
          key: controller.formstate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildListView(controller),
          ),
        ),
      ),
    );
  }

  ListView _buildListView(ConfrimController controller) {
    return ListView(
      children: [
        buildHeader(),
        const SizedBox(height: 15),
        const AddPhoto(),
        const SizedBox(height: 20),
        buildNameField(controller),
        const SizedBox(height: 10),
        buildEmailField(controller),
        const SizedBox(height: 20),
        const CoustomTextFieldPhoneEmail(),
        const SizedBox(height: 20),
        buildNextButton(controller),
      ],
    );
  }
}
