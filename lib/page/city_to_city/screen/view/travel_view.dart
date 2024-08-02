import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/bottom_button.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/comment.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/date_select.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/fare_offer.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/passenger_number.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/ride_type_button.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/travel_main_widget.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';
import 'package:indriveclone/shared/back_to_home.dart';

class TravelView extends StatelessWidget {
  const TravelView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TravelController());
    // ignore: deprecated_member_use
    return GetBuilder<TravelController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          onRefresh: controller.isThereInternet,
          widget: WillPopScope(
            onWillPop: onWillPop(context),
            child: Scaffold(
              drawer: const MyDrawer(),
              appBar: AppBar(
                title: const Text("City to city"),
              ),
              body: const TravelViewBody(),
            ),
          ));
    });
  }
}

class TravelViewBody extends StatelessWidget {
  const TravelViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TravelController controller = Get.put(TravelController());

    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const SizedBox(height: 20),
        buildChooseLocationWidget(controller, true, "From"),
        const SizedBox(height: 15),
        buildChooseLocationWidget(controller, false, "To"),
        const SizedBox(height: 15),
        const RideTypeButtons(),
        const SizedBox(height: 15),
        const DateSelectionWidget(),
        const SizedBox(height: 15),
        const PassengerNumberWidget(),
        const SizedBox(height: 15),
        const FareOfferWidget(),
        const SizedBox(height: 15),
        const CommentsWidget(),
        const SizedBox(height: 20),
        BottomButton(
            onPressed: () {
              controller.goToFindDriver();
            },
            title: "Find a driver"),
      ],
    );
  }
}
