import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/category_widget.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/driver_button.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/profile_list_tile.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    MyDrawerController controller = Get.put(MyDrawerController());
    return Drawer(
      width: Get.width / 1.2,
      backgroundColor: const Color(0xff1C1F24),
      child: ListView(
        children: [
          ProvileListTile(
            onPressed: () {
              controller.goToProfile();
            },
            Imagename: AppImage.avatar,
            username: "Abdallh",
            rate: 3.6,
          ),
          const SizedBox(height: 15),
          const Divider(height: 0),
          ...buildCategoryWidgets(controller),
          const Divider(height: 0),
          const SizedBox(height: 15),
          ButtonDriverMode(onPressed: () {}),
        ],
      ),
    );
  }

  List<Widget> buildCategoryWidgets(MyDrawerController controller) {
    return controller.categories.map<Widget>((category) {
      return GetBuilder<MyDrawerController>(
        builder: (controller) => DrawrerCategoriresWidget(
          isActive: controller.isActive,
          onPressed: () {
            category['navigate'](controller);
            controller.setActvie(category['index']);
          },
          icon: category['icon'],
          isActivenumber: category['index'],
          categoryname: category['name'],
        ),
      );
    }).toList();
  }
}
