import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/handling_data_view.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/page/history/screen/widget/history/build_appbar.dart';
import 'package:indriveclone/page/history/screen/widget/history/build_body.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';
import 'package:indriveclone/page/history/controller/history_controller.dart';
import 'package:indriveclone/shared/back_to_home.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());

    return WillPopScope(
      onWillPop: onWillPop(context),
      child: Scaffold(
        appBar: buildAppBarHistroy(),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder<HistoryController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: buildBody(controller),
                    onRefresh: () async {
                      Get.offNamed(AppRoute.historyview);
                    },
                  )),
        ),
      ),
    );
  }
}
