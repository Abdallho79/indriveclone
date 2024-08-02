import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';

class VechielBottomSheet extends StatelessWidget {
  const VechielBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    FreightController controller = Get.find();

    return Container(
      height: 260,
      // padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.setBackGrounColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: <Widget>[
          RowTitle(
            title: "Which vechicle is suitable for you cargo?",
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          VehicleOption(
            vehicleName: "(Rob3 Naa'l) (Dababa)",
            description:
                "up to 1.3t – transports larger appliances, like a fridge, furniture, or building materials",
            dimensions: "len/wid/hgt: 1.5/1.4/1.8m",
            vehicleIcon: Icons.local_shipping,
            onTap: () {
              controller.whichCar(1, "(Rob3 Naa'l) (Dababa)");
              Get.back();
            },
            car: controller.isNaal,
            carnumber: 1,
          ),
          VehicleOption(
            vehicleName: "Compact car",
            description:
                "up to 300 kg - delivery on a car; i.e. your heavy goods or a few boxes during the moving",
            dimensions: "len/wid/hgt: 1.8/1.3/0.6m",
            vehicleIcon: Icons.directions_car,
            onTap: () {
              controller.whichCar(2, "Compact car");
              Get.back();
            },
            car: controller.isNaal,
            carnumber: 2,
          ),
        ],
      ),
    );
  }
}

class VehicleOption extends StatelessWidget {
  final String vehicleName;
  final String description;
  final String dimensions;
  final IconData vehicleIcon;
  final Function() onTap;
  final int car;
  final int carnumber;

  const VehicleOption({
    super.key,
    required this.vehicleName,
    required this.description,
    required this.dimensions,
    required this.vehicleIcon,
    required this.onTap,
    required this.car,
    required this.carnumber,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: car == carnumber
          ? AppColor.setIsActiveLightColor()
          : AppColor.setBackGrounColor(),
      onPressed: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            vehicleIcon,
            size: 50,
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  vehicleName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.setWhiteAndBlack(),
                      fontSize: 14,
                      decoration: TextDecoration.none),
                ),
                Text(
                  dimensions,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.setWhiteAndBlack(),
                      fontSize: 12,
                      decoration: TextDecoration.none),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
