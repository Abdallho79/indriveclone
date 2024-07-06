import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/home/controller/find_driver_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/appbar_title.dart';

class FindDriverView extends StatelessWidget {
  const FindDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FindDriverController());
    return const Scaffold(
      backgroundColor: AppColor.background_dark,
      bottomSheet: MyBottomSheet(),
      appBar: AppBarTitle(title: "Find driver"),
      body: GoogleMapContent(),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    FindDriverController controller = Get.put(FindDriverController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: AppColor.background_dark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      constraints: BoxConstraints(maxHeight: Get.height / 2.2),
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: ListView.builder(
          itemCount: controller.workers.length,
          itemBuilder: (context, index) {
            return Card(
              color: AppColor.background_light,
              child: ListTile(
                onTap: () {
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
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    controller.workers[index]["avatar"],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              MyCoustomText(
                                text:
                                    "name: ${controller.workers[index]["name"]}",
                                color: Colors.white,
                                weight: FontWeight.w600,
                                size: 20,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 10),
                              MyCoustomText(
                                text:
                                    "Distance to reach you: ${controller.workers[index]["distance"]}",
                                color: Colors.white,
                                weight: FontWeight.normal,
                                size: 16,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 10),
                              MyCoustomText(
                                text:
                                    "Car Brand: ${controller.workers[index]["carBrand"]}",
                                color: Colors.white,
                                weight: FontWeight.normal,
                                size: 16,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              MyCoustomText(
                                text:
                                    "Offer: ${controller.workers[index]["offer"]} \$",
                                color: AppColor.green,
                                weight: FontWeight.normal,
                                size: 16,
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  AppColor.green)),
                                      onPressed: () {},
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
                                              WidgetStatePropertyAll(
                                                  Colors.red[400])),
                                      onPressed: () {},
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
                },
                subtitle: Text(
                  "${controller.workers[index]["distance"]}, 9 mins",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                title: MyCoustomText(
                  text: controller.workers[index]["name"],
                  color: Colors.white,
                  weight: FontWeight.w600,
                  size: 20,
                  textAlign: TextAlign.start,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    controller.workers[index]["avatar"],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: MyCoustomText(
                  text: "Offer: ${controller.workers[index]["offer"]} \$",
                  color: AppColor.green,
                  weight: FontWeight.normal,
                  size: 16,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GoogleMapContent extends StatelessWidget {
  const GoogleMapContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<FindDriverController>(
              builder: (controller) {
                return GoogleMap(
                  initialCameraPosition: controller.initialPosition,
                  markers: controller.markers.toSet(),
                  polylines: controller.polylineSet,
                  mapType: MapType.normal,
                  onMapCreated: controller.onMapCreated,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
