import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/linkapi_app.dart';
import 'package:indriveclone/page/profile/controller/profile_controller.dart';
import 'package:indriveclone/page/profile/screen/widget/build_picture_option.dart';

SizedBox buildProfilePicture(ProfileController controller) {
  return SizedBox(
    height: 200,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        GetBuilder<ProfileController>(
          builder: (_) {
            if (controller.oldPhotoPath == "" &&
                controller.newPhotoPath == "") {
              return const Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
              );
            } else if (controller.oldPhotoPath != "" &&
                controller.newPhotoPath == "") {
              return Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.network(
                    "${AppLink.imagesPerson}/${controller.oldPhotoPath}",
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            } else if (controller.newPhotoPath != "" &&
                controller.file!.path.isNotEmpty) {
              return Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.file(
                    controller.file!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }
            return Container();
          },
        ),
        Positioned(
          left: Get.width / 1.8,
          bottom: -20,
          child: IconButton(
            color: AppColor.green,
            iconSize: 28,
            onPressed: () {
              Get.bottomSheet(
                const PictureOptionsBottomSheetProfileAdd(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    ),
  );
}
