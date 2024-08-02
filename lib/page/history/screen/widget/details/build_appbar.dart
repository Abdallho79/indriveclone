import 'package:flutter/material.dart';
import 'package:indriveclone/page/history/controller/ride_details_controller.dart';

AppBar buildAppBarHistroyDetials(
    RideDetailsController controller, void Function() onPressed) {
  return AppBar(
    centerTitle: true,
    title: Text(controller.date),
    actions: [
      IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    ],
  );
}
