import 'package:flutter/material.dart';
import 'package:indriveclone/core/class/my_coustm_text.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/linkapi_app.dart';
import 'package:indriveclone/page/find_driver/controller/find_driver_controller.dart';
import 'package:indriveclone/page/find_driver/screen/widget/find_driver_dialog.dart';

class WorkerCard extends StatelessWidget {
  final FindDriverController controller;
  final int index;

  const WorkerCard({required this.controller, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.background_light,
      child: ListTile(
        onTap: () {
          showWorkerDialog(context, controller, index);
        },
        subtitle: Text(
          "${controller.drivers[index].distance!.toStringAsFixed(2)} km ",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        title: MyCoustomText(
          text: controller.drivers[index].driverName!,
          color: Colors.white,
          weight: FontWeight.w600,
          size: 20,
          textAlign: TextAlign.start,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image.network(
            "${AppLink.imagesPerson}/${controller.drivers[index].driverProfilePictureUrl!}",
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        // trailing: MyCoustomText(
        //   text: "Offer: ${controller.drivers[index]["offer"]} \$",
        //   color: controller.drivers[index]["offer"] <= controller.fare
        //       ? AppColor.green
        //       : Colors.red[400],
        //   weight: FontWeight.normal,
        //   size: 16,
        //   textAlign: TextAlign.center,
        // ),
      ),
    );
  }
}
