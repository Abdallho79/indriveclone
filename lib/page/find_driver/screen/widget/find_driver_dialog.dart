import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/linkapi_app.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_mab_controller.dart';

void showWorkerDialog(BuildContext context, FindDriverController controller,
    FindDriverMabController mapController, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.setBackGrounColor(),
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "${AppLink.imagesPerson}/${controller.drivers[index].driverProfilePictureUrl!}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MyCoustomText(
                text: "name: ${controller.drivers[index].driverName}",
                weight: FontWeight.w600,
                size: 20,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              MyCoustomText(
                text:
                    "Distance to reach you: ${controller.drivers[index].distance!.toStringAsFixed(2)} Km",
                weight: FontWeight.normal,
                size: 16,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              MyCoustomText(
                text: "Car Brand: ${controller.drivers[index].driverCarModel}",
                weight: FontWeight.normal,
                size: 16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              MyCoustomText(
                text:
                    "Car Plate: ${controller.drivers[index].driverCarLicensePlate}",
                weight: FontWeight.normal,
                size: 16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              MyCoustomText(
                text:
                    "phone number: ${controller.drivers[index].driverPhoneNumber}",
                weight: FontWeight.normal,
                size: 16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColor.green)),
                      onPressed: () {
                        controller.selectedDriver(index);
                      },
                      child: const MyCoustomText(
                        text: "Order",
                        weight: FontWeight.normal,
                        size: 16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blue[400])),
                      onPressed: () {
                        mapController.changeCameraPosition(
                            controller.drivers[index].driverLatitude!,
                            controller.drivers[index].driverLongitude!);
                        Get.back();
                      },
                      child: const MyCoustomText(
                        text: "View",
                        weight: FontWeight.normal,
                        size: 16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
