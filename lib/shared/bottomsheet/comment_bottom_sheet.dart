import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/button_bottom_sheet.dart';
import 'package:indriveclone/page/city_to_city/screen/widget/button-title/row_title.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/shared/mixin/required_deatils.dart';

// ignore: must_be_immutable
class CommentBottomSheet extends StatelessWidget {
  late RequiredDeatils controller;
  CommentBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    FreightController commentsController = Get.put(FreightController());

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
          RowTitle(
            title: "Desccription of the cargo",
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(height: 10),
          Form(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: commentsController.commentController,
                    maxLines: 5,
                    maxLength: 500,
                    enableIMEPersonalizedLearning: true,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      hintText:
                          "For example: wardrobe 150/210 cm and five boxes with",
                      hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
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
                            commentsController.commentController!.text);
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
