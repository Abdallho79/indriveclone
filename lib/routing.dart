import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:indriveclone/core/constant/rout_app.dart';
import 'package:indriveclone/page/auth/screen/view/confrim_view.dart';
import 'package:indriveclone/page/auth/screen/view/verify_view.dart';
import 'package:indriveclone/page/city_to_city/screen/view/travel_view.dart';
import 'package:indriveclone/page/freight/screen/view/freight_view.dart';
import 'package:indriveclone/page/history/screen/view/history_view.dart';
import 'package:indriveclone/page/history/screen/view/ride_details_view.dart';
import 'package:indriveclone/page/home/screen/view/find_driver_view.dart';
import 'package:indriveclone/page/home/screen/view/home_view.dart';
import 'package:indriveclone/page/my_map.dart';
import 'package:indriveclone/page/profile/screen/view/provile_view.dart';
import 'package:indriveclone/page/settings/screen/view/settings_view.dart';
import 'package:indriveclone/page/support/screen/view/support_view.dart';
import 'package:indriveclone/test.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppRoute.finddriver,
    // name: AppRoute.finddriver,
    page: () => FindDriverView(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => Test(),
    // middlewares: [MyMiddaleWare()]
  ),
  GetPage(
    name: AppRoute.profileview,
    page: () => ProfileView(),
  ),
  GetPage(
    name: AppRoute.map,
    page: () => GoogleMapChooseLocation(),
  ),
  GetPage(
    name: AppRoute.support,
    page: () => SupportView(),
  ),
  GetPage(
    name: AppRoute.settings,
    page: () => SettingsView(),
  ),
  GetPage(
    name: AppRoute.homeview,
    page: () => HomeView(),
  ),
  GetPage(
    name: AppRoute.travelview,
    page: () => TravelView(),
  ),
  GetPage(
    name: AppRoute.frieghtview,
    page: () => FreightView(),
  ),
  GetPage(
    name: AppRoute.historyview,
    page: () => HistoryView(),
  ),
  GetPage(
    name: AppRoute.rideDetails,
    page: () => RideDetailsView(),
  ),
  GetPage(
    name: AppRoute.verifyview,
    page: () => VerifyView(),
  ),
  GetPage(
    name: AppRoute.confrimview,
    page: () => ConfrimView(),
  ),
];
