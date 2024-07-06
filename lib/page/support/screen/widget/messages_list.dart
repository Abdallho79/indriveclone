import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/support/controller/support_controller.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    SupportController controller = Get.find();
    return StreamBuilder<QuerySnapshot>(
      stream: controller.getMessagesStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        controller.processMessages(snapshot.data!);
        return GetBuilder<SupportController>(
          builder: (_) {
            return ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              itemCount: controller.messagesList.length,
              itemBuilder: (context, index) {
                var message = controller.messagesList[index];
                bool isSentByMe =
                    message["sender"] == controller.phoneNumberFromApp;
                return Align(
                  alignment:
                      isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: isSentByMe
                        ? const EdgeInsets.only(
                            left: 100, top: 10, bottom: 10, right: 10)
                        : const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 100),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: isSentByMe
                            ? AppColor.background_light
                            : Colors.grey,
                        borderRadius: !isSentByMe
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15),
                              )
                            : const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                              )),
                    child: Text(
                      message["text"]!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
