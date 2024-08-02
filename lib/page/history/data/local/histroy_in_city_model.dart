class TravelInCityDetailsModel {
  String? driverName;
  String? driverPhoneNumber;
  String? driverCarModel;
  String? driverRating;
  int? driverNumOfRides;
  String? driverProfilePictureUrl;
  String? usersName;
  int? travelId;
  int? userId;
  int? driverId;
  String? travelStartTime;
  int? travelTimeInMinute;
  int? travelDistance;
  int? travelCost;
  double? travelFromLat;
  double? travelFromLong;
  String? travelFromName;
  double? travelToLat;
  double? travelToLong;
  String? travelToName;
  String? travelType;

  TravelInCityDetailsModel(
      {this.driverName,
      this.driverPhoneNumber,
      this.driverCarModel,
      this.driverRating,
      this.driverNumOfRides,
      this.driverProfilePictureUrl,
      this.usersName,
      this.travelId,
      this.userId,
      this.driverId,
      this.travelStartTime,
      this.travelTimeInMinute,
      this.travelDistance,
      this.travelCost,
      this.travelFromLat,
      this.travelFromLong,
      this.travelFromName,
      this.travelToLat,
      this.travelToLong,
      this.travelToName,
      this.travelType});

  TravelInCityDetailsModel.fromJson(Map<String, dynamic> json) {
    driverName = json['driver_name'];
    driverPhoneNumber = json['driver_phoneNumber'];
    driverCarModel = json['driver_carModel'];
    driverRating = json['driver_rating'];
    driverNumOfRides = json['driver_numOfRides'];
    driverProfilePictureUrl = json['driver_profilePictureUrl'];
    usersName = json['users_name'];
    travelId = json['travel_id'];
    userId = json['user_id'];
    driverId = json['driver_id'];
    travelStartTime = json['travel_startTime'];
    travelTimeInMinute = json['travel_time_inMinute'];
    travelDistance = json['travel_distance'];
    travelCost = json['travel_cost'];
    travelFromLat = json['travel_from_lat'];
    travelFromLong = json['travel_from_long'];
    travelFromName = json['travel_from_name'];
    travelToLat = json['travel_to_lat'];
    travelToLong = json['travel_to_long'];
    travelToName = json['travel_to_name'];
    travelType = json['travel_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_name'] = driverName;
    data['driver_phoneNumber'] = driverPhoneNumber;
    data['driver_carModel'] = driverCarModel;
    data['driver_rating'] = driverRating;
    data['driver_numOfRides'] = driverNumOfRides;
    data['driver_profilePictureUrl'] = driverProfilePictureUrl;
    data['users_name'] = usersName;
    data['travel_id'] = travelId;
    data['user_id'] = userId;
    data['driver_id'] = driverId;
    data['travel_startTime'] = travelStartTime;
    data['travel_time_inMinute'] = travelTimeInMinute;
    data['travel_distance'] = travelDistance;
    data['travel_cost'] = travelCost;
    data['travel_from_lat'] = travelFromLat;
    data['travel_from_long'] = travelFromLong;
    data['travel_from_name'] = travelFromName;
    data['travel_to_lat'] = travelToLat;
    data['travel_to_long'] = travelToLong;
    data['travel_to_name'] = travelToName;
    data['travel_type'] = travelType;
    return data;
  }
}
