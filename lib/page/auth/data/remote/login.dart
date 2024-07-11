import 'dart:io';

import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/link_app.dart';

class LoginData {
  Curd crud;
  LoginData(this.crud);

  insertData(
    String phone_number,
    String username,
  ) async {
    var response = await crud.postData(AppLink.loginPhone, {
      "phonenumber": phone_number,
      "username": username,
    });
    return response.fold((l) => l, (r) => r);
  }

  insertDataGoogle(String phone_number, String google_email, String username,
      File? file) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.loginGmail,
        {
          "phonenumber": phone_number,
          "googleemail": google_email,
          "username": username,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
