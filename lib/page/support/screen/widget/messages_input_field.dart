import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/support/controller/support_controller.dart';
import 'package:indriveclone/page/support/screen/widget/text_field_support.dart';

class MessageInputField extends StatelessWidget {
  final SupportController controller;

  const MessageInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CoustomTextFieldSupport(
              controller: controller.messageController,
              hinttext: "",
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColor.green)),
            onPressed: () {
              controller.saveMessage();
              if (controller.messageTextFromApp != "") {
                controller.firebaseFirestore.collection("messages").add({
                  "text": controller.messageTextFromApp,
                  "sender": controller.phoneNumberFromApp,
                  "time": FieldValue.serverTimestamp()
                });
                controller.messageController.clear();
              }
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
