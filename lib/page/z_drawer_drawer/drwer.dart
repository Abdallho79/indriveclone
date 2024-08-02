import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/build_profile_listtile.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/category_widget.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    MyDrawerController controller = Get.put(MyDrawerController());
    return Drawer(
      width: Get.width / 1.2,
      child: ListView(
        children: [
          buildProfileListTile(controller),
          const SizedBox(height: 15),
          ...buildCategoryWidgets(controller),
          const SizedBox(height: 15),
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
