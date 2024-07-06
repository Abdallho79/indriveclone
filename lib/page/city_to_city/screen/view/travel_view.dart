import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/bottom_button.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/comment.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/date_select.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/fare_offer.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/passenger_number.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/ride_type_button.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/travel_main_widget.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';

class TravelView extends StatelessWidget {
  const TravelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TravelController());
    return WillPopScope(
      child: Scaffold(
        backgroundColor: AppColor.background_dark,
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("City to city"),
        ),
        body: TravelViewBody(),
      ),
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeView()),
            (route) => false);
        Get.find<MyDrawerController>().isActive = 1;
        return Future.value(true); // Allow pop});
      },
    );
  }
}

class TravelViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        SizedBox(height: 20),
        TravelMainWidget(),
        SizedBox(height: 15),
        RideTypeButtons(),
        SizedBox(height: 15),
        DateSelectionWidget(),
        SizedBox(height: 15),
        PassengerNumberWidget(),
        SizedBox(height: 15),
        FareOfferWidget(),
        SizedBox(height: 15),
        CommentsWidget(),
        SizedBox(height: 20),
        BottomButton(onPressed: () {}, title: "Find a driver"),
      ],
    );
  }
}
