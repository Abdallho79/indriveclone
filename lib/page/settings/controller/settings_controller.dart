import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {


  

  final List<Map<String, dynamic>> settingsOptions = [
    {
      "text": "Phone number",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
        // Action to change phone number
      }
    },
    {
      "text": "Language",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
        // Action to change language
      }
    },
    {
      "text": "Date and distance",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
      }
    },
    {
      "text": "Night mode",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
      }
    },
    {
      "text": "Rules and terms",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
      }
    },
    {
      "text": "Log out",
      "icon": null,
      "onTap": () {
      }
    },
  ];
}
