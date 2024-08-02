import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';

Text buildDateText(HistoryController controller) {
  return Text(
    "Date: ${controller.Date}",
    style: TextStyle(fontSize: 16, color: AppColor.setTextColor()),
  );
}
