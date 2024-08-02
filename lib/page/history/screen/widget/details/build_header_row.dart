import 'package:flutter/material.dart';
import 'package:indriveclone/linkapi_app.dart';
import 'package:indriveclone/page/history/controller/ride_details_controller.dart';
import 'package:indriveclone/page/history/screen/widget/details/sub_widgets/coustom_icon_text_column.dart';
import 'package:indriveclone/page/history/screen/widget/details/sub_widgets/driver_photo.dart';

Row buildHeaderRow(RideDetailsController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      DriverPhoto(
        imagePath:
            "${AppLink.imagesPerson}/${controller.data.driverProfilePictureUrl!}",
        driverName: controller.data.driverName!,
      ),
      CoustomIconTextColumn(
        onPressed: controller.goToSupport,
        text: "Support",
        iconData: Icons.mark_unread_chat_alt_sharp,
      ),
      CoustomIconTextColumn(
        onPressed: controller.goToReciper,
        text: "Receipt",
        iconData: Icons.receipt_long,
      ),
    ],
  );
}
