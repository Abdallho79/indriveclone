import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/page/profile/controller/profile_controller.dart';
import 'package:indriveclone/page/profile/screen/widget/build_profile_fileds.dart';
import 'package:indriveclone/page/profile/screen/widget/build_profile_picture.dart';
import 'package:indriveclone/page/profile/screen/widget/build_svae_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
        bottomNavigationBar: buildSaveButton(profileController),
        appBar: AppBar(
          title: const Text('Profile settings'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Show confirmation dialog when back button is pressed
              profileController.goToBack();
            },
          ),
        ),
        body: GetBuilder<ProfileController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  onRefresh: controller.isThereInternet,
                  widget: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        const SizedBox(height: 30),
                        buildProfilePicture(profileController),
                        const SizedBox(height: 20),
                        buildProfileFields(profileController),
                      ],
                    ),
                  ),
                )));
  }
}
