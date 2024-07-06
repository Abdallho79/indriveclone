import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/home/screen/widget/services_icon.dart';

class ListViewSerivces extends StatelessWidget {
  const ListViewSerivces({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ServicesIcon(
          imagename: "Ride",
          name: AppImage.ride,
          onTap: () {},
          onLongPress: () {},
          isActive: 1,
        ),
        ServicesIcon(
          imagename: "Moto",
          name: AppImage.moto,
          onTap: () {},
          onLongPress: () {},
          isActive: 2,
        ),
        ServicesIcon(
          imagename: "City to city",
          name: AppImage.citytocity,
          onTap: () {},
          onLongPress: () {},
          isActive: 3,
        ),
        ServicesIcon(
          imagename: "Delivery",
          name: AppImage.delivery,
          onTap: () {},
          onLongPress: () {},
          isActive: 4,
        ),
        ServicesIcon(
          imagename: "Freight",
          name: AppImage.freight,
          onTap: () {},
          onLongPress: () {},
          isActive: 5,
        ),
        ServicesIcon(
          imagename: "Services",
          name: AppImage.services,
          onTap: () {},
          onLongPress: () {},
          isActive: 6,
        ),
        ServicesIcon(
          imagename: "Repair",
          name: AppImage.repair,
          onTap: () {},
          onLongPress: () {},
          isActive: 7,
        ),
      ],
    );
  }
}
