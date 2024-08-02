
  import 'package:flutter/material.dart';
import 'package:indriveclone/core/function/valid_input.dart';
import 'package:indriveclone/core/shared/coustom_text_form_fireld.dart';
import 'package:indriveclone/page/profile/controller/profile_controller.dart';

Widget buildProfileFields(ProfileController controller) {
    return Column(
      children: [
        CoustomTextField(
          suffix: const Icon(Icons.person),
          validator: (val) {
            return validInput(2, 50, "text", val!);
          },
          controller: controller.nameController,
          isNumber: false,
          isEnable: true,
          hinttext: "Enter your name",
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            controller.logInWithGoogle();
          },
          child: CoustomTextField(
            suffix: const Icon(Icons.email),
            validator: (val) {
              return validInput(2, 50, "text", val!);
            },
            controller: controller.emailController,
            isNumber: false,
            isEnable: false,
            hinttext: "Enter your email",
          ),
        ),
      ],
    );
  }

