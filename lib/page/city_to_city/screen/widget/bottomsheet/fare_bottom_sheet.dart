import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';

class FareBottomSheetTravel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TravelController fareController = Get.put(TravelController());

    return Container(
      height: 330,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 33, 33, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RowTitle(title: "Offer your fare"),
          SizedBox(height: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Offer your fare",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: fareController.fareController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixText: 'EGP ',
                    prefixStyle: TextStyle(color: Colors.white, fontSize: 26),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                  ),
                ),
                Divider(
                  endIndent: 60,
                  indent: 60,
                ),
                SizedBox(height: 20),
                BottomSheetButton(
                    onPressed: () {
                      fareController.validate();
                    },
                    title: "Done")
              ],
            ),
          )
        ],
      ),
    );
  }
}
