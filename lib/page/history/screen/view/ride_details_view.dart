import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:indriveclone/page/history/controller/ride_details_controller.dart';
import 'package:indriveclone/page/history/screen/widget/history/details/coustom_icon_text_column.dart';
import 'package:indriveclone/page/history/screen/widget/history/details/coustom_icon_text_row.dart';
import 'package:indriveclone/page/history/screen/widget/history/details/driver_photo.dart';

class RideDetailsView extends StatelessWidget {
  const RideDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    RideDetailsController controller = Get.put(RideDetailsController());
    return Scaffold(
      backgroundColor: AppColor.background_dark,
      appBar: AppBar(
        centerTitle: true,
        title: Text("26 February 12:33"),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DriverPhoto(imagePath: AppImage.avatar, driverName: "Abdallh"),
                CoustomIconTextColumn(
                    onPressed: () {},
                    text: "Support",
                    iconData: Icons.mark_unread_chat_alt_sharp),
                CoustomIconTextColumn(
                    onPressed: () {},
                    text: "Receipr",
                    iconData: Icons.receipt_long)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    GetBuilder<RideDetailsController>(
                      builder: (controller) {
                        return Expanded(
                          child: GoogleMap(
                            initialCameraPosition: controller.initialPosition,
                            markers: controller.markers.toSet(),
                            polylines: controller.polylines,
                            onMapCreated: (GoogleMapController mapController) {
                              controller.googleMapController!
                                  .complete(mapController);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Details",
              style: TextStyle(color: Colors.grey[500], fontSize: 26),
            ),
            ...List.generate(controller.rideDetails.length, (index) {
              return CoustomTextIconRow(
                icon: controller.rideDetails[index]["icon"],
                text: controller.rideDetails[index]["text"],
                color: controller.rideDetails[index]["color"],
              );
            }),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            MyCoustomText(
                text: "Vehicle",
                color: Colors.grey[500],
                weight: FontWeight.normal,
                size: 26,
                textAlign: null),
            MyCoustomText(
                text: "Silver Oktavia, 1634 ABC",
                color: Colors.white,
                weight: FontWeight.normal,
                size: 16,
                textAlign: null)
          ],
        ),
      ),
    );
  }
}
