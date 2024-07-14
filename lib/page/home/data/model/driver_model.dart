class DriverModel {
  int? driverId;
  String? driverName;
  String? driverPhoneNumber;
  double? driverLatitude;
  double? driverLongitude;
  String? driverCarModel;
  int? driverNumOfRides;
  String? driverProfilePictureUrl;
  double? distance;

  DriverModel(
      {this.driverId,
      this.driverName,
      this.driverPhoneNumber,
      this.driverLatitude,
      this.driverLongitude,
      this.driverCarModel,
      this.driverNumOfRides,
      this.driverProfilePictureUrl,
      this.distance});

  DriverModel.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverPhoneNumber = json['driver_phoneNumber'];
    driverLatitude = json['driver_latitude'];
    driverLongitude = json['driver_longitude'];
    driverCarModel = json['driver_carModel'];
    driverNumOfRides = json['driver_numOfRides'];
    driverProfilePictureUrl = json['driver_profilePictureUrl'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_id'] = driverId;
    data['driver_name'] = driverName;
    data['driver_phoneNumber'] = driverPhoneNumber;
    data['driver_latitude'] = driverLatitude;
    data['driver_longitude'] = driverLongitude;
    data['driver_carModel'] = driverCarModel;
    data['driver_numOfRides'] = driverNumOfRides;
    data['driver_profilePictureUrl'] = driverProfilePictureUrl;
    data['distance'] = distance;
    return data;
  }
}
