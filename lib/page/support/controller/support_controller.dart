import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/function/coustom_print.dart';
import 'package:indriveclone/core/services/services.dart';

class SupportController extends GetxController {
  late FirebaseFirestore firebaseFirestore;
  late TextEditingController messageController;
  String? messageTextFromApp;
  String? messageTextFromServer;
  String? phoneNumberFromApp;
  MyServices myServices = Get.find();
  List<Map<String, String>> messagesList = [];

  void saveMessage() {
    messageTextFromApp = messageController.text;
  }

  Stream<QuerySnapshot> getMessagesStream() {
    return firebaseFirestore
        .collection("messages")
        .where("id", isEqualTo: myServices.sharedPreferences.getString("id"))
        .orderBy("time")
        .snapshots();
  }

  void processMessages(QuerySnapshot snapshot) {
    messagesList.clear();

    if (snapshot.docs.isEmpty) {
      return;
    }

    for (var message in snapshot.docs.reversed) {
      messageTextFromServer = message.get("text");
      String messageSender = message.get("sender");
      PrintString("messageTextFromServer", messageTextFromServer);
      messagesList.add({
        "text": messageTextFromServer!,
        "sender": messageSender,
      });
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    messageController = TextEditingController();
    phoneNumberFromApp = myServices.sharedPreferences.getString("phonenumber");
    firebaseFirestore = FirebaseFirestore.instance;
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
