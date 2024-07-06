import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';

class PictureOptionsBottomSheetAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FreightController controller = Get.put(FreightController());
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        children: [
          RowTitle(title: "Picture of your cargo"),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.white),
            title: Text('Camera',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              controller.pickImage(ImageSource.camera);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo, color: Colors.white),
            title: Text('Choose from gallery',
                style: TextStyle(color: Colors.white, fontSize: 18)),
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
    FreightController controller = Get.put(FreightController());
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        children: [
          RowTitle(title: "Picture of your cargo"),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.white),
            title: Text('Retake',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              controller.updateImage(index, ImageSource.camera);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo, color: Colors.white),
            title: Text('Choose from gallery',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              controller.updateImage(index, ImageSource.gallery);

              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.white),
            title: Text('Delete',
                style: TextStyle(color: Colors.white, fontSize: 18)),
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
