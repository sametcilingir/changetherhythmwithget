import 'home_routes.dart';
import 'init_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/init';

  static final routes = [
    ...InitRoutes.routes,
    ...HomeRoutes.routes,
  ];
}
