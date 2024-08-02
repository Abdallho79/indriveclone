import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/settings/controller/settings_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';
import 'package:indriveclone/shared/back_to_home.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.put(SettingsController());

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        drawer: const MyDrawer(),
        body: GetBuilder<SettingsController>(
          builder: (controller) => ListView(
            children: [
              ...List.generate(
                  settingsController.settingsOptions.length,
                  (index) => SettingsButton(
                      onTap: settingsController.settingsOptions[index]['onTap'],
                      text: settingsController.settingsOptions[index]['text'],
                      iconData: settingsController.settingsOptions[index]
                          ['icon'],
                      subText: settingsController.settingsOptions[index]
                          ['suppText'],
                      isTwoText: settingsController.settingsOptions[index]
                          ["isTwo"])),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Function() onTap;
  final bool isTwoText;
  final String text;
  final String subText;
  final IconData? iconData;

  const SettingsButton({
    super.key,
    required this.onTap,
    required this.text,
    this.iconData,
    required this.subText,
    required this.isTwoText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isTwoText ? 90 : 70,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: AppColor.setWhiteAndBlack(),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  if (isTwoText)
                    Text(
                      subText,
                      style: TextStyle(
                          color: AppColor.setWhiteAndBlack(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                ],
              ),
              const Spacer(),
              if (iconData != null)
                Icon(
                  iconData,
                  color: AppColor.setWhiteAndBlack(),
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
