import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';

class PictureOptionsBottomSheetAdd extends StatelessWidget {
  const PictureOptionsBottomSheetAdd({super.key});

  @override
  Widget build(BuildContext context) {
    FreightController controller = Get.find();

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
            title: "Picture of your cargo",
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
            ),
            title: const Text('Camera', style: TextStyle(fontSize: 18)),
            onTap: () {
              controller.pickImage(ImageSource.camera);
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.photo,
            ),
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

class PictureOptionsBottomSheetImage extends StatelessWidget {
  final int index;

  const PictureOptionsBottomSheetImage({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    FreightController controller = Get.find();
    return Container(
      height: 250,
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
            title: "Picture of your cargo",
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
            ),
            title: const Text('Retake', style: TextStyle(fontSize: 18)),
            onTap: () {
              controller.updateImage(index, ImageSource.camera);
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.photo,
            ),
            title: const Text('Choose from gallery',
                style: TextStyle(fontSize: 18)),
            onTap: () {
              controller.updateImage(index, ImageSource.gallery);

              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.delete,
            ),
            title: const Text('Delete', style: TextStyle(fontSize: 18)),
            onTap: () {
              controller.removeImage(index);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
