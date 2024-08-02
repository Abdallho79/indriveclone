import 'dart:io';

import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/linkapi_app.dart';

class FindDriverFrieghtData {
  Curd crud;
  FindDriverFrieghtData(this.crud);

  findDriver(Map data) async {
    var response = await crud.postData(AppLink.findDiverFrieght, data);
    return response.fold((l) => l, (r) => r);
  }

  sendImages( String delivery_id ,List<File> images) async {
    var response = await crud.addRequestWithImages(
        AppLink.sendImagesFrieght,
        {
          "delivery_id": delivery_id,
          "file_length": images.length.toString(),
        },
        images);
    return response.fold((l) => l, (r) => r);
  }
}
