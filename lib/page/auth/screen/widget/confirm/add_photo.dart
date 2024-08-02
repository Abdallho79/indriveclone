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
      width: 160,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          GetBuilder<ConfrimController>(builder: (controller) {
            if (controller.selectedphoto != null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  File(controller.selectedphoto!),
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
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
              bottom: -15,
              left: Get.width / 2,
              child: IconButton(
                onPressed: () {
                  Get.bottomSheet(TakePhoto("Take A photo", confrimController));
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
      color: AppColor.setBackGrounColor(),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    child: ListView(
      children: [
        RowTitle(
          title: "Take a photo",
          onPressed: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.camera_alt,
          ),
          title: const Text('Camera', style: TextStyle(fontSize: 18)),
          onTap: () async {
            controller.file = await pickImageFromCamera();
            controller.isTherePhoto();

            Get.back();
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.photo,
          ),
          title:
              const Text('Choose from gallery', style: TextStyle(fontSize: 18)),
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
