import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/linkapi_app.dart';

class FindDriverData {
  Curd crud;
  FindDriverData(this.crud);

  findDriver(double lat  , double long) async {

    var response = await crud.postData(AppLink.findDiverInCity, {
      "user_long" : long.toString() ,
      "user_lat" : lat.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
