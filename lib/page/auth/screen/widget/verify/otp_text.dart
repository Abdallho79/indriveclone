import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpText extends StatelessWidget {
  final Function(String) onSubmit;
  const OtpText({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fieldWidth: 30,
      showCursor: false,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      borderRadius: BorderRadius.circular(15),
      numberOfFields: 6,
      borderColor: const Color.fromARGB(255, 12, 46, 196),
      onCodeChanged: (String code) {},
      onSubmit: onSubmit,
    );
  }
}
