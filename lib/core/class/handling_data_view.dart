import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indriveclone/core/class/status_request.dart';
import 'package:indriveclone/core/constant/image_app.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final Future<void> Function() onRefresh;
  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.onRefresh,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImage.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: Get.height / 4),
                          child: Lottie.asset(AppImage.offline,
                              width: 250, height: 250),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppImage.server, width: 250, height: 250))
                : statusRequest == StatusRequest.nodatafailure
                    ? Center(
                        child: Lottie.asset(AppImage.noData,
                            width: 250, height: 250, repeat: true))
                    : widget;
  }
}
