import 'dart:io';

import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/linkapi_app.dart';

class UpdateProfileData {
  Curd crud;
  UpdateProfileData(this.crud);

  updateDate(Map data, File? file) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.updateprofile, data, file, "photo");
    return response.fold((l) => l, (r) => r);
  }
}
