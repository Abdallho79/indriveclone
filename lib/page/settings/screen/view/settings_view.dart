import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/settings/controller/settings_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.put(SettingsController());

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeView()),
            (route) => false);
        Get.find<MyDrawerController>().isActive = 1;
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            ...List.generate(
              settingsController.settingsOptions.length,
              (index) => SettingsButton(
                onTap: settingsController.settingsOptions[index]['onTap'],
                text: settingsController.settingsOptions[index]['text'],
                iconData: settingsController.settingsOptions[index]['icon'],
              ),
            ),
            MaterialButton(
              height: 70,
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyCoustomText(
                  text: "Delete account",
                  color: Colors.red,
                  weight: FontWeight.bold,
                  size: 20,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData? iconData;

  const SettingsButton({
    super.key,
    required this.onTap,
    required this.text,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5),
          child: Row(
            children: [
              MyCoustomText(
                text: text,
                color: Colors.white,
                weight: FontWeight.w600,
                size: 22,
                textAlign: TextAlign.start,
              ),
              Spacer(),
              if (iconData != null)
                Icon(
                  iconData,
                  color: Colors.grey[400],
                  size: 25,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// settings_controller.dart
