import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/page/freight/screen/widget/bottomsheet/comment_bottom_sheet.dart';
import 'package:indriveclone/page/freight/screen/widget/bottomsheet/vechicel_bottom_sheet.dart';
import 'package:indriveclone/page/main_widget.dart';

class ShippingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<FreightController>(
          builder: (controller) => TheMainWidget(
            onPressed: () {
              Get.bottomSheet(
                  isDismissible: false, CommentBottomSheetFreight());
            },
            staticText: "Description of the cargo",
            inputText: "${Get.find<FreightController>().comment}",
          ),
        ),
        SizedBox(height: 15),
        GetBuilder<FreightController>(
          builder: (controller) => TheMainWidget(
            onPressed: () {
              Get.bottomSheet(isDismissible: false, VechielBottomSheet());
            },
            staticText: "Which car is suitable",
            inputText: Get.find<FreightController>().choosencar,
          ),
        ),
      ],
    );
  }
}
