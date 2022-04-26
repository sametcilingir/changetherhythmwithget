import 'package:get/get.dart';

import '../modules/init/init_binding.dart';
import '../modules/init/init_page.dart';

class InitRoutes {
  InitRoutes._();

  static final routes = [
    GetPage(
      name: '/init',
      page: InitPage.new,
      binding: InitBinding(),
    ),
  ];
}
