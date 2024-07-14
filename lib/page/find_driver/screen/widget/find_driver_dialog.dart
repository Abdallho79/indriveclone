import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/linkapi_app.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';

void showWorkerDialog(
    BuildContext context, FindDriverController controller, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.background_light,
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Center(
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(100),
              //     child: Image.network(
              //       "${AppLink.imagesPerson}/${controller.drivers[index].driverProfilePictureUrl!}",
              //       width: 100,
              //       height: 100,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),
              MyCoustomText(
                text: "name: ${controller.drivers[index].driverName}",
                color: Colors.white,
                weight: FontWeight.w600,
                size: 20,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              MyCoustomText(
                text:
                    "Distance to reach you: ${controller.drivers[index].distance!.toStringAsFixed(2)}",
                color: Colors.white,
                weight: FontWeight.normal,
                size: 16,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              MyCoustomText(
                text: "Car Brand: ${controller.drivers[index].driverCarModel}",
                color: Colors.white,
                weight: FontWeight.normal,
                size: 16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // MyCoustomText(
              //   text: "Offer: ${controller.drivers[index]["offer"]} \$",
              //   color: controller.drivers[index]["offer"] <= controller.fare
              //       ? AppColor.green
              //       : Colors.red[400],
              //   weight: FontWeight.normal,
              //   size: 16,
              //   textAlign: TextAlign.center,
              // ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColor.green)),
                      onPressed: () {
                        controller.goToTrackingView();
                      },
                      child: const MyCoustomText(
                        text: "Order",
                        color: Colors.white,
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
                              WidgetStatePropertyAll(Colors.red[400])),
                      onPressed: () {
                        Get.back();
                      },
                      child: const MyCoustomText(
                        text: "Cancel",
                        color: Colors.white,
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
