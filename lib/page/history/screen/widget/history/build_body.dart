import 'package:flutter/material.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';
import 'package:indriveclone/page/history/screen/widget/history/build_histroy_card.dart';

ListView buildBody(HistoryController controller) {
  return ListView.builder(
    itemCount: controller.data.length,
    itemBuilder: (context, index) {
      return buildHistoryCard(controller, index);
    },
  );
}
