import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';

class NumberPassengersBottomSheetTravel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TravelController travelController = Get.put(TravelController());

    return Container(
      height: 220,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RowTitle(title: "How many of you will go?"),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColor.background_light)),
                  iconSize: 30,
                  onPressed: () {
                    travelController.inCeremnt();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              GetBuilder<TravelController>(
                builder: (controller) => MyCoustomText(
                    text: "${controller.numberPassengers}",
                    color: Colors.white,
                    weight: FontWeight.bold,
                    size: 24,
                    textAlign: TextAlign.center),
              ),
              IconButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColor.background_light)),
                  iconSize: 30,
                  onPressed: () {
                    travelController.deCeremnt();
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ))
            ],
          ),
          Spacer(),
          BottomSheetButton(
              onPressed: () {
                travelController
                    .selectPassengers(travelController.numberPassengers);
                Get.back();
              },
              title: "Done")
        ],
      ),
    );
  }
}
