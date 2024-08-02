import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/auth/controller/login_controller.dart';
import 'package:indriveclone/page/auth/screen/widget/login/social_button.dart';

Widget buildSocialButton(LoginController controller) {
  return SocialButton(
    onTap: () async {
      await controller.logInWithGoogle();
    },
    keytitle: "google",
    image: AppImage.google,
    height55facebook45googlr: 45,
  );
}
