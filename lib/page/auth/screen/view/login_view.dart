import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/page/auth/controller/login_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/login/build_form_feilds.dart';
import 'package:indriveclone/page/auth/screen/widget/login/build_headre.dart';
import 'package:indriveclone/page/auth/screen/widget/login/build_login_button.dart';
import 'package:indriveclone/page/auth/screen/widget/login/build_or_text.dart';
import 'package:indriveclone/page/auth/screen/widget/login/build_social_button.dart';
import 'package:indriveclone/page/auth/screen/widget/login/coustom_text_span.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Scaffold build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formstate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: _buildListView(controller),
            ),
          ),
          onRefresh: controller.isThereInternet,
        ),
      ),
    );
  }

  ListView _buildListView(LoginController controller) {
    return ListView(
      children: [
        buildHeaderSection(),
        buildFormFields(controller),
        buildLoginButton(controller),
        buildOrText(),
        buildSocialButton(controller),
        const SizedBox(
          height: 15,
        ),
        const CoustomTextSpan()
      ],
    );
  }
}
