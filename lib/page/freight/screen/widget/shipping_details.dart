import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/page/freight/screen/widget/bottomsheet/vechicel_bottom_sheet.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';
import 'package:indriveclone/shared/bottomsheet/comment_bottom_sheet.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<FreightController>(
          builder: (controller) => TheMainWidget(
            onPressed: () {
              Get.bottomSheet(
                  isDismissible: false,
                  CommentBottomSheet(
                    controller: controller,
                  ));
            },
            staticText: "Description of the cargo",
            inputText: Get.find<FreightController>().comment,
          ),
        ),
        const SizedBox(height: 15),
        GetBuilder<FreightController>(
          builder: (controller) => TheMainWidget(
            onPressed: () {
              Get.bottomSheet(isDismissible: false, const VechielBottomSheet());
            },
            staticText: "Which car is suitable",
            inputText: Get.find<FreightController>().choosencar,
          ),
        ),
      ],
    );
  }
}
