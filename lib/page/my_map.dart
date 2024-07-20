import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/page/main_button.dart';
import 'package:indriveclone/page/my_map_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/coustom_icon.dart';

class GoogleMapChooseLocation extends StatelessWidget {
  const GoogleMapChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    MyGoogleMapChosseLocationController controller =
        Get.put(MyGoogleMapChosseLocationController());
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              right: 15,
              top: 20,
              child: CoustomIconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icons.share,
              ),
            ),
            Column(
              children: [
                Expanded(
                    child: GetBuilder<MyGoogleMapChosseLocationController>(
                        builder: (controller) => GoogleMap(
                              onTap: controller.getLocationDetails,
                              initialCameraPosition: controller.initialPosition,
                              markers: controller.markers.toSet(),
                              mapType: MapType.normal,
                              onMapCreated: controller.onMapCreated,
                            ))),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 40,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 60,
                  child: MyMainButton(
                      onPressed: () {
                        controller.goToHome();
                      },
                      title: "Choose Location"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
