import 'package:get/get.dart';
import 'package:embeddedhouseapp/pages/home_page.dart';
import 'package:embeddedhouseapp/pages/lights_page.dart';

class Routes{
  static String homePage = '/home_page';
  static String lightsPage = '/lights_page';
}

final getPages = [
  GetPage(
    name: Routes.homePage,
    page: () => const HomePage(),
  ),
  GetPage(
    name: Routes.lightsPage,
    page: () => const LightsPage(),
  ),
];