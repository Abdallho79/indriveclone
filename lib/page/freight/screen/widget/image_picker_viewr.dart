import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/freight/controller/freight_controller.dart';
import 'package:indriveclone/page/freight/screen/widget/bottomsheet/camera_bottom_sheet.dart';

class ImagePickerAndViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyCoustomText(
          text: "Picture of your cargo",
          color: Colors.white,
          weight: FontWeight.normal,
          size: 16,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                minWidth: 100,
                height: 100,
                onPressed: () {
                  Get.bottomSheet(PictureOptionsBottomSheetAdd());
                },
                color: AppColor.background_light,
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: GetBuilder<FreightController>(
                  builder: (controller) => controller.imagesList.isEmpty
                      ? SizedBox.shrink()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.imagesList.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.bottomSheet(PictureOptionsBottomSheetImage(
                                index: index,
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.file(
                                  controller.imagesList[index],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
