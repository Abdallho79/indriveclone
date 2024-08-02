import 'package:indriveclone/core/class/crud.dart';
import 'package:indriveclone/linkapi_app.dart';

class AddTravelData {
  Curd crud;
  AddTravelData(this.crud);

  findDriver(Map travelData) async {
    var response = await crud.postData(AppLink.travelAddInCity, travelData);
    return response.fold((l) => l, (r) => r);
  }
}
