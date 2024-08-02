import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/shared/widgets/main_widget.dart';
import 'package:indriveclone/shared/bottomsheet/comment_bottom_sheet.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key});

  @override
  GetBuilder build(BuildContext context) {
    return GetBuilder<TravelController>(
      builder: (controller) => TheMainWidget(
        onPressed: () {
          Get.bottomSheet(
              isDismissible: false,  CommentBottomSheet(controller: controller,));
        },
        staticText: "Comments",
        inputText: controller.comment,
      ),
    );
  }
}
