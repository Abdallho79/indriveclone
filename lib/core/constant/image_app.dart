import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:indriveclone/core/services/services.dart';

class AppImage {
  static MyServices myServices = Get.find();
  static String theme = myServices.sharedPreferences.getString("theme")!;

  // Routs
  static const String routeimage = "assets/image";
  static const String routelottie = "assets/lottie";
  static const String routeicon = "assets/marker";
  static const String routemabtheme = "assets/json";
  // OnBoarding

  static const String mypdf = "$routeimage/mypdf.pdf";

  static const String onboarding = "$routeimage/onboarding.jpeg";
  static const String logo = "$routeimage/logo.jpeg";
  static const String avatar = "$routeimage/avatar.jpeg";
  static const String usericon = "$routeimage/person.png";
  // SocialIcon
  static const String google = "$routeimage/googleicon.png";
  static const String facebook = "$routeimage/facebook.png";
  static const String whatsapp = "$routeimage/whatsapp.png";
  // Google Map
  static const String carmarker = "$routeicon/car.png";
  static const String markerfrom = "$routeimage/green.png";
  static const String markerto = "$routeimage/blue.png";
  static const String markerdriver = "$routeimage/red.png";
  static const String darkmabtheme = "$routemabtheme/darkmab.json";
  static const String lightmabtheme = "$routemabtheme/darkmab.json";
  // services
  static const String delivery = "$routeimage/delivery.png";
  static const String freight = "$routeimage/freight.png";
  static const String services = "$routeimage/services.png";
  static const String repair = "$routeimage/repair.png";
  static const String cleaning = "$routeimage/cleaning.png";

  static const String citytocity = "$routeimage/citytocitiy.png";

  //  Lottie
  static const String ecommerce = "$routelottie/ecommerce.json";
  static const String loading = "$routelottie/cart.json";
  static const String offline = "$routelottie/offline.json";
  static const String noData = "$routelottie/nodata.json";
  static const String server = "$routelottie/server.json";
  static const String finddriver = "$routelottie/search.json";

  // Light & Dark
  static const String rideDark = "$routeimage/ride.jpeg";
  static const String rideLight = "$routeimage/ride_light.jpg";
  static const String motoDark = "$routeimage/moto.png";
  static const String motoLight = "$routeimage/moto_light.jpg";

  static const String privateDark = "$routeimage/privateride.png";
  static const String sharedDark = "$routeimage/sharedride.png";
  static const String privateLight = "$routeimage/private_light.jpg";
  static const String sharedLight = "$routeimage/shared_light.jpg";

  // تحديث theme في AppColor
  static void updateThemeImage(String newTheme) {
    theme = newTheme;
  }

  static String setRideColor() {
    return theme == "dark" ? rideDark : rideLight;
  }

  static String setMotoColor() {
    return theme == "dark" ? motoDark : motoLight;
  }

  static String setPrivateColor() {
    return theme == "dark" ? privateDark : privateLight;
  }

  static String setSharedColor() {
    return theme == "dark" ? sharedDark : sharedLight;
  }
}
