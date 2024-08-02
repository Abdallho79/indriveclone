import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/profile/controller/profile_controller.dart';

class PictureOptionsBottomSheetProfileAdd extends StatelessWidget {
  const PictureOptionsBottomSheetProfileAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();

    return Container(
      height: 200,
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
            title: "Choose",
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera', style: TextStyle(fontSize: 18)),
            onTap: () {
              controller.pickImage(ImageSource.camera);
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Choose from gallery',
                style: TextStyle(fontSize: 18)),
            onTap: () {
              controller.pickImage(ImageSource.gallery);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
