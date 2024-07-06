import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';

class FareBottomSheetFreight extends StatelessWidget {
  const FareBottomSheetFreight({super.key});

  @override
  Widget build(BuildContext context) {
    FreightController fareController = Get.put(FreightController());

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(33, 33, 33, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(child: RowTitle(title: "Offer your fare")),
          const SizedBox(height: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: fareController.fareController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixText: 'EGP ',
                    prefixStyle: TextStyle(color: Colors.white, fontSize: 26),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  endIndent: 60,
                  indent: 60,
                ),
                const SizedBox(height: 20),
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
