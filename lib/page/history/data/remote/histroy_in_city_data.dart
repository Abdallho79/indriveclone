import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/linkapi_app.dart';

class HistroyInCityViewData {
  Curd crud;
  HistroyInCityViewData(this.crud);

  findDriver(String userid, int offset, int limit) async {
    var response = await crud.postData(AppLink.travelDetailsInCity, {
      "userid": userid,
      "offset": offset.toString(),
      "limit": limit.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
