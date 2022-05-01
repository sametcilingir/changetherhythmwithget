import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static final routes = [
    GetPage(
      name: '/home/:cityID',
      page: HomePage.new,
      binding: HomeBinding(),
      transition: Transition.cupertino 
    ),
  ];
}
