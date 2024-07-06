import 'package:flutter/material.dart';
import 'package:indriveclone/core/constant/color_app.dart';
import 'package:indriveclone/core/constant/image_app.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColor.background_light,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AppImage.usericon,
              height: 100,
              width: 100,
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 30,
                  Icons.add,
                  color: AppColor.green,
                ),
              ))
        ],
      ),
    );
  }
}
