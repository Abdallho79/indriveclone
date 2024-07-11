import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/middleware.dart';
import 'package:indriveclone/page/auth/screen/view/confrim_view.dart';
import 'package:indriveclone/page/auth/screen/view/login_view.dart';
import 'package:indriveclone/page/auth/screen/view/verify_view.dart';
import 'package:indriveclone/page/city_to_city/screen/view/travel_view.dart';
import 'package:indriveclone/page/find_driver/screen/view/find_driver_view.dart';
import 'package:indriveclone/page/find_driver/screen/view/tracking_to_home.dart';
import 'package:indriveclone/page/freight/screen/view/freight_view.dart';
import 'package:indriveclone/page/history/screen/view/history_view.dart';
import 'package:indriveclone/page/history/screen/view/ride_details_view.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/my_map.dart';
import 'package:indriveclone/page/profile/screen/view/provile_view.dart';
import 'package:indriveclone/page/settings/screen/view/settings_view.dart';
import 'package:indriveclone/page/support/screen/view/support_view.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: "/",
      page: () => const LoginView(),
      // middlewares: [MyMiddaleWare()]
      ),
  GetPage(
    name: AppRoute.trackingtohome,
    page: () => const TrackingToUserHomeView(),
  ),
  GetPage(
    name: AppRoute.finddriver,
    page: () => const FindDriverView(),
  ),
  GetPage(
    name: AppRoute.profileview,
    page: () => ProfileView(),
  ),
  GetPage(
    name: AppRoute.map,
    page: () => const GoogleMapChooseLocation(),
  ),
  GetPage(
    name: AppRoute.support,
    page: () => const SupportView(),
  ),
  GetPage(
    name: AppRoute.settings,
    page: () => const SettingsView(),
  ),
  GetPage(
    name: AppRoute.homeview,
    page: () => const HomeView(),
  ),
  GetPage(
    name: AppRoute.travelview,
    page: () => const TravelView(),
  ),
  GetPage(
    name: AppRoute.frieghtview,
    page: () => const FreightView(),
  ),
  GetPage(
    name: AppRoute.historyview,
    page: () => const HistoryView(),
  ),
  GetPage(
    name: AppRoute.rideDetails,
    page: () => const RideDetailsView(),
  ),
  GetPage(
    name: AppRoute.verifyview,
    page: () => const VerifyView(),
  ),
  GetPage(
    name: AppRoute.confrimview,
    page: () => const ConfrimView(),
  ),
];
