import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/linkapi_app.dart';

class FindDriverCityToCityData {
  Curd crud;
  FindDriverCityToCityData(this.crud);

  findDriver(Map data) async {
    var response = await crud.postData(AppLink.findDiverCityToCity, data);
    return response.fold((l) => l, (r) => r);
  }
}
