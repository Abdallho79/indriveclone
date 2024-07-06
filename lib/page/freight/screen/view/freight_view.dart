import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/page/freight/screen/widget/fare.dart';
import 'package:indriveclone/page/freight/screen/widget/image_picker_viewr.dart';
import 'package:indriveclone/page/freight/screen/widget/pick_up_times_putton.dart';
import 'package:indriveclone/page/freight/screen/widget/shipping_details.dart';
import 'package:indriveclone/page/main_widget.dart';

class FreightView extends StatelessWidget {
  const FreightView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FreightController());
    // ignore: deprecated_member_use
    return WillPopScope(
      child: Scaffold(
        backgroundColor: AppColor.background_dark,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text("Freight"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const SizedBox(height: 20),
            TheMainWidget(
              onPressed: () {},
              inputText: "Cairo , Street 55",
              staticText: "Pickup location",
            ),
            const SizedBox(height: 15),
            TheMainWidget(
              onPressed: () {},
              staticText: "Destination",
              inputText: '',
            ),
            const SizedBox(height: 15),
            const MyCoustomText(
              text: "Pickup time",
              color: Colors.white,
              weight: FontWeight.normal,
              size: 18,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 5),
            const PickupTimeButtons(),
            const SizedBox(height: 15),
            const ShippingDetails(),
            const SizedBox(height: 15),
            const ImagePickerAndViewer(),
            const SizedBox(height: 15),
            const FareFreight(),
            const SizedBox(height: 20),
            BottomSheetButton(onPressed: () {}, title: "Find a driver"),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeView()),
            (route) => false);
        Get.find<MyDrawerController>().isActive = 1;
        return Future.value(true); // Allow pop});
      },
    );
  }
}
