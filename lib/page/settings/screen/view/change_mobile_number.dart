import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/settings/controller/change_mobile_number_controller.dart';
import 'package:indriveclone/page/settings/screen/widget/phone_number.dart';
import 'package:indriveclone/shared/widgets/main_button.dart';

class ChangePhoneNumberPage extends StatelessWidget {
  const ChangePhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeMobileNumberController controller =
        Get.put(ChangeMobileNumberController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your new phone number:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            const ChangePhoneNUmberField(),
            const SizedBox(height: 30),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                height: 55,
                child: MyMainButton(
                    onPressed: () {
                      controller.goToVerifyPage();
                    },
                    title: "Update phone number")),
          ],
        ),
      ),
    );
  }
}
