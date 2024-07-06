import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  AppBarTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
