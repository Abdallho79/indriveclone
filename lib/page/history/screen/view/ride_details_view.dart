import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/history/controller/ride_details_controller.dart';
import 'package:indriveclone/page/history/screen/widget/details/build_appbar.dart';
import 'package:indriveclone/page/history/screen/widget/details/build_details.dart';
import 'package:indriveclone/page/history/screen/widget/details/build_header_row.dart';
import 'package:indriveclone/page/history/screen/widget/details/build_map_section.dart';
import 'package:indriveclone/page/history/screen/widget/details/build_vechile_details.dart';

class RideDetailsView extends StatelessWidget {
  const RideDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    RideDetailsController controller = Get.put(RideDetailsController());
    return Scaffold(
      appBar: buildAppBarHistroyDetials(controller , (){}),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            buildHeaderRow(controller),
            const SizedBox(height: 20),
            buildMapSection(controller),
            const SizedBox(height: 20),
            buildDetailsSection(controller),
            const SizedBox(height: 20),
            buildVehicleSection(controller),
          ],
        ),
      ),
    );
  }


}
