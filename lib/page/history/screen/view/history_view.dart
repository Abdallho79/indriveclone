import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';
import 'package:indriveclone/page/history/screen/widget/history/details/coustom_icon_text_row.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());

    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeView()),
              (route) => false);
          Get.find<MyDrawerController>().isActive = 1;
          return Future.value(true); // Allow pop});
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("My rides"),
          ),
          drawer: MyDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: controller.goToDetials,
                  child: Card(
                    color: AppColor.background_dark,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "26 February, 12:33",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "EGP : 55 ",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(controller.rideDetails.length,
                              (index) {
                            return CoustomTextIconRow(
                              icon: controller.rideDetails[index]["icon"],
                              text: controller.rideDetails[index]["text"],
                              color: controller.rideDetails[index]["color"],
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Column(
                                children: [
                                  GetBuilder<HistoryController>(
                                    builder: (controller) {
                                      return Expanded(
                                        child: GoogleMap(
                                          initialCameraPosition:
                                              controller.initialPosition,
                                          markers: controller.markers.toSet(),
                                          polylines: controller.polylines,
                                          onMapCreated: controller.onMapCreated,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
