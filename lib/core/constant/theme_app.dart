import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';

class AppTheme {
  static ThemeData themeEnglish = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.background_dark,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
      scaffoldBackgroundColor: AppColor.background_light,
      textTheme: TextTheme(
        labelSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[400]),
        labelMedium: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[400]),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey[400],
          decoration: TextDecoration.underline,
          decorationColor: Colors.grey[400],
        ),
        bodyLarge: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 211, 211, 211),
            fontWeight: FontWeight.w500),
      ));
  static ThemeData themeArabic = ThemeData(
      textTheme: TextTheme(
    bodyLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
        fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w500),
  ));
}
