import 'package:flutter/material.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/coustom_icon.dart';

Positioned buildMenuButton(BuildContext context) {
  return Positioned(
    left: 15,
    top: 20,
    child: CoustomIconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: Icons.menu,
    ),
  );
}

Positioned buildShareButton() {
  return Positioned(
    right: 15,
    top: 20,
    child: CoustomIconButton(
      onPressed: () {},
      icon: Icons.share,
    ),
  );
}
