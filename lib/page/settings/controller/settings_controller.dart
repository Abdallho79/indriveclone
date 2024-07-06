import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {


  

  final List<Map<String, dynamic>> settingsOptions = [
    {
      "text": "Phone number",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
        // Action to change phone number
        print("Change phone number");
      }
    },
    {
      "text": "Language",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
        // Action to change language
        print("Change language");
      }
    },
    {
      "text": "Date and distance",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
        // Action to change date and distance
        print("Change date and distance");
      }
    },
    {
      "text": "Night mode",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
        // Action to toggle night mode
        print("Toggle night mode");
      }
    },
    {
      "text": "Rules and terms",
      "icon": Icons.arrow_forward_ios_outlined,
      "onTap": () {
        // Action to show rules and terms
        print("Show rules and terms");
      }
    },
    {
      "text": "Log out",
      "icon": null,
      "onTap": () {
        // Action to log out
        print("Log out");
      }
    },
  ];
}
