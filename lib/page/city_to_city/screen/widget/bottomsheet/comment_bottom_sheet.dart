import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/controller/travel_controller.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';

class CommentBottomSheetTravel extends StatelessWidget {
  const CommentBottomSheetTravel({super.key});

  @override
  Widget build(BuildContext context) {
    TravelController commentsController = Get.put(TravelController());

    return Container(
      height: 350,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(33, 33, 33, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          const RowTitle(title: "Comments"),
          const SizedBox(height: 10),
          Form(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: commentsController.commentContrller,
                    maxLines: 5,
                    maxLength: 500,
                    enableIMEPersonalizedLearning: true,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      fillColor: AppColor.background_light,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BottomSheetButton(
                      onPressed: () {
                        commentsController.setComment(
                            commentsController.commentContrller!.text);
                        Get.back();
                      },
                      title: "Done")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
