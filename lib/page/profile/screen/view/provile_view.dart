import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/profile/controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              // Implement your save logic here
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: AppColor.green,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: const MyCoustomText(
                text: "Save",
                color: Colors.black,
                weight: FontWeight.bold,
                size: 20,
                textAlign: null)),
      ),
      appBar: AppBar(
        title: const Text('Profile settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            buildProfileField(
              icon: Icons.person,
              label: 'First name',
              controller: profileController.firstNameController,
            ),
            buildProfileField(
              icon: Icons.person_outline,
              label: 'Last name',
              controller: profileController.lastNameController,
            ),
            buildProfileField(
              icon: Icons.email,
              label: 'Email',
              controller: profileController.emailController,
            ),
            InkWell(
              onTap: () {
                // Show bottom sheet to select location
                showLocationBottomSheet(context);
              },
              child: buildProfileField(
                icon: Icons.location_city,
                label: 'Location',
                controller: profileController.locationController,
                enabled: false,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildProfileField({
    required IconData icon,
    required String label,
    required TextEditingController? controller,
    bool enabled = true,
  }) {
    return TextField(
      style: const TextStyle(fontSize: 16, decoration: TextDecoration.none),
      cursorColor: Colors.white,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: label,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }

  void showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: const Text('Cairo'),
                onTap: () {
                  profileController.locationController.text = 'Cairo';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Alexandria'),
                onTap: () {
                  profileController.locationController.text = 'Alexandria';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Luxor'),
                onTap: () {
                  profileController.locationController.text = 'Luxor';
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
