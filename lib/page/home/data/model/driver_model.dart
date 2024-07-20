class DriverModel {
  int? driverId;
  String? driverName;
  String? driverCarModel;
  int? driverNumOfRides;
  String? driverProfilePictureUrl;
  String? driverRating;
  double? driverLongitude;
  double? driverLatitude;
  String? driverPhoneNumber;
  String? driverCarLicensePlate;
  double? distance;

  DriverModel(
      {this.driverId,
      this.driverName,
      this.driverCarModel,
      this.driverNumOfRides,
      this.driverProfilePictureUrl,
      this.driverRating,
      this.driverLongitude,
      this.driverLatitude,
      this.driverPhoneNumber,
      this.driverCarLicensePlate,
      this.distance});

  DriverModel.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverCarModel = json['driver_carModel'];
    driverNumOfRides = json['driver_numOfRides'];
    driverProfilePictureUrl = json['driver_profilePictureUrl'];
    driverRating = json['driver_rating'];
    driverLongitude = json['driver_longitude'];
    driverLatitude = json['driver_latitude'];
    driverPhoneNumber = json['driver_phoneNumber'];
    driverCarLicensePlate = json['driver_carLicensePlate'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_id'] = driverId;
    data['driver_name'] = driverName;
    data['driver_carModel'] = driverCarModel;
    data['driver_numOfRides'] = driverNumOfRides;
    data['driver_profilePictureUrl'] = driverProfilePictureUrl;
    data['driver_rating'] = driverRating;
    data['driver_longitude'] = driverLongitude;
    data['driver_latitude'] = driverLatitude;
    data['driver_phoneNumber'] = driverPhoneNumber;
    data['driver_carLicensePlate'] = driverCarLicensePlate;
    data['distance'] = distance;
    return data;
  }
}
