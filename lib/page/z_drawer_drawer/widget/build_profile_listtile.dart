import 'package:get/get.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/profile_list_tile.dart';

GetBuilder buildProfileListTile(MyDrawerController controller) {
  return GetBuilder<MyDrawerController>(
      builder: (controlller) => ProvileListTile(
            onPressed: () {
              controller.goToProfile();
            },
            photoPath: controlller.photoPath,
            username: controller.username,
            rate: 3.6,
          ));
}
