class AppLink {
  static const String server = "http://10.0.2.2/coursephp/indrivecole_back";
  // static const String server =
  //     "http://192.168.56.1/coursephp/indriveclone_back";

  static const String imagesPerson =
      "http://10.0.2.2/coursephp/indrivecole_back/upload/profile";
  static const String reicpiePerson =
      "http://10.0.2.2/coursephp/indrivecole_back/upload/recipie";

  // Login
  static const String loginPhone = "$server/auth/loginPhone.php";
  static const String loginGmail = "$server/auth/loginGmail.php";
  static const String updateprofile = "$server/profile/profile.php";

  // travel InCity
  static const String findDiverInCity =
      "$server/travel/in_city/find_driver.php";
  static const String travelAddInCity = "$server/travel/in_city/add.php";
  static const String travelDetailsInCity = "$server/travel/in_city/view.php";
  static const String travelDeleteInCity = "$server/travel/in_city/delete.php";

  // travel CityToCity
  static const String findDiverCityToCity =
      "$server/travel/city_to_city/add.php";

  static const String travelDetailsCityToCity =
      "$server/travel/city_to_city/view.php";
  static const String travelDeleteCityToCity =
      "$server/travel/city_to_city/delete.php";

  // travel Frieght
  static const String findDiverFrieght = "$server/travel/delivery/add.php";
  static const String sendImagesFrieght =
      "$server/travel/delivery/add_image.php";
}
