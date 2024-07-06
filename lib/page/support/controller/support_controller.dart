import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/services/services.dart';

class SupportController extends GetxController {
  // تعريف Firebase Firestore للاستخدام لاحقاً
  late FirebaseFirestore firebaseFirestore;

  // تعريف TextEditingController للتحكم في حقل إدخال الرسالة
  late TextEditingController messageController;

  // متغيرات لتخزين نص الرسالة المرسلة والمستلمة
  String? messageTextFromApp;
  String? messageTextFromServer;

  // متغير لتخزين رقم الهاتف من الإعدادات
  String? phoneNumberFromApp;

  // خدمة مخصصة للحصول على إعدادات التطبيق
  MyServices myServices = Get.find();

  // قائمة لتخزين الرسائل المستلمة
  List<Map<String, String>> messagesList = [];

  // دالة لحفظ نص الرسالة من التطبيق
  void saveMessage() {
    messageTextFromApp = messageController.text;
  }

  // دالة للحصول على Stream من الرسائل من Firestore
  Stream<QuerySnapshot> getMessagesStream() {
    return firebaseFirestore.collection("messages").orderBy("time").snapshots();
  }

  // دالة لمعالجة الرسائل الواردة من Firestore
  void processMessages(QuerySnapshot snapshot) {
    // تفريغ قائمة الرسائل الحالية
    messagesList.clear();

    // إضافة الرسائل الجديدة إلى القائمة
    for (var message in snapshot.docs.reversed) {
      messageTextFromServer = message.get("text");
      String messageSender = message.get("sender");
      messagesList.add({
        "text": messageTextFromServer!,
        "sender": messageSender,
      });
    }

    // تحديث واجهة المستخدم
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // تهيئة TextEditingController
    messageController = TextEditingController();

    // الحصول على رقم الهاتف من الإعدادات
    phoneNumberFromApp = myServices.sharedPreferences.getString("phone_number");

    // تهيئة Firestore instance
    firebaseFirestore = FirebaseFirestore.instance;
  }

  @override
  void dispose() {
    // التخلص من TextEditingController عند عدم الحاجة إليه
    messageController.dispose();
    super.dispose();
  }
}
