import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';

class VechielBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FreightController controller = Get.put(FreightController());

    return Container(
      height: 300,
      // padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 33, 33, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: <Widget>[
          RowTitle(title: "Which vechicle is suitable for you cargo?"),
          SizedBox(height: 10),
          SizedBox(height: 10),
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
          SizedBox(height: 10),
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
          ? Color(0xff0C4769)
          : const Color.fromRGBO(33, 33, 33, 1),
      onPressed: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            vehicleIcon,
            size: 50,
            color: Colors.white,
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  vehicleName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                      fontSize: 14,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 5),
                Text(
                  dimensions,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
