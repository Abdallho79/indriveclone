class AppLink {
  static const String server = "http://10.0.2.2/coursephp/indrivecole_back";
  // static const String server =
  //     "http://192.168.56.1/coursephp/indriveclone_back";

  static const String imagesPerson =
      "http://10.0.2.2/coursephp/indrivecole_back/upload/profile";

  // Login
  static const String loginPhone = "$server/auth/loginPhone.php";
  static const String loginGmail = "$server/auth/loginGmail.php";

  // travel InCity
  static const String findDiverInCity = "$server//driver/in_city/view.php";
  static const String travelAddInCity = "$server/travel/in_city/add.php";
  static const String travelDetailsInCity = "$server/travel/in_city/view.php";
  static const String travelDeleteInCity = "$server/travel/in_city/delete.php";

  // travel CityToCity
  static const String findDiverCityToCity =
      "$server//driver/city_to_city/view.php";
  static const String travelAddCityToCity =
      "$server/travel/city_to_city/add.php";
  static const String travelDetailsCityToCity =
      "$server/travel/city_to_city/view.php";
  static const String travelDeleteCityToCity =
      "$server/travel/city_to_city/delete.php";
}
