import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/profile/controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfileView({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: MyCoustomText(
                text: "Save",
                color: Colors.black,
                weight: FontWeight.bold,
                size: 20,
                textAlign: null)),
      ),
      appBar: AppBar(
        title: Text('Profile settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
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
      style: TextStyle(fontSize: 16, decoration: TextDecoration.none),
      cursorColor: Colors.white,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }

  void showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text('Cairo'),
                onTap: () {
                  profileController.locationController.text = 'Cairo';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Alexandria'),
                onTap: () {
                  profileController.locationController.text = 'Alexandria';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Luxor'),
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
