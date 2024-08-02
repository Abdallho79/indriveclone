import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/linkapi_app.dart';

class FindDriverInCityData {
  Curd crud;
  FindDriverInCityData(this.crud);

  findDriver(double lat, double long, String iscar) async {
    var response = await crud.postData(AppLink.findDiverInCity, {
      "user_long": long.toString(),
      "user_lat": lat.toString(),
      "isCar": iscar,
    });
    return response.fold((l) => l, (r) => r);
  }
}
