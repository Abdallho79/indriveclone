import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/support/controller/support_controller.dart';
import 'package:indriveclone/page/support/screen/widget/messages_input_field.dart';
import 'package:indriveclone/page/support/screen/widget/messages_list.dart';
import 'package:indriveclone/page/z_drawer_drawer/drawer_controller.dart';
import 'package:indriveclone/page/z_drawer_drawer/drwer.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/appbar_title.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    SupportController controller = Get.put(SupportController());
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeView()),
            (route) => false);
        Get.find<MyDrawerController>().isActive = 1;
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: AppColor.background_dark,
        appBar: AppBarTitle(title: "Support"),
        drawer: MyDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: MessageList(),
            ),
            MessageInputField(controller: controller),
          ],
        ),
      ),
    );
  }
}
