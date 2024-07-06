import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';

class CommentBottomSheetFreight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FreightController commentsController = Get.put(FreightController());

    return Container(
      height: 350,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 33, 33, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          RowTitle(title: "Desccription of the cargo"),
          SizedBox(height: 10),
          Form(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: commentsController.commentContrller,
                    maxLines: 5,
                    maxLength: 500,
                    enableIMEPersonalizedLearning: true,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      hintText:
                          "For example: wardrobe 150/210 cm and five boxes with",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                      fillColor: AppColor.background_light,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
