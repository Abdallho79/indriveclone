import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/core/function/take_photo.dart';
import 'package:indriveclone/page/auth/controller/confrim_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    ConfrimController confrimController = Get.find();
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColor.background_light,
            ),
          ),
          GetBuilder<ConfrimController>(builder: (controller) {
            if (controller.selectedphoto != null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  File(controller.selectedphoto!),
                  height: 120,
                  width: 120,
                ),
              );
            } else {
              // إذا لم يتم اختيار صورة، عرض صورة افتراضية
              return ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  AppImage.avatar,
                  height: 100,
                  width: 100,
                ),
              );
            }
          }),
          Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                      TakePhoto("Take A photo", confrimController));
                },
                icon: const Icon(
                  size: 30,
                  Icons.add,
                  color: AppColor.green,
                ),
              ))
        ],
      ),
    );
  }
}

Container TakePhoto(String title, ConfrimController controller) {
  return Container(
    height: 160,
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    child: ListView(
      children: [
        const RowTitle(title: "Take a photo"),
        ListTile(
          leading: const Icon(Icons.camera_alt, color: Colors.white),
          title: const Text('Camera',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          onTap: () async {
            controller.file = await pickImageFromCamera();
            controller.isTherePhoto();

            Get.back();
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo, color: Colors.white),
          title: const Text('Choose from gallery',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          onTap: () async {
            controller.file = await pickFileFromStorage();
            controller.isTherePhoto();
            Get.back();
          },
        ),
      ],
    ),
  );
}
