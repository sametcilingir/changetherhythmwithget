import 'home_routes.dart';
import 'init_routes.dart';
import 'register_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/init';
  static const REGISTER = '/register';
  

  static final routes = [
    ...InitRoutes.routes,
    ...HomeRoutes.routes,
		...RegisterRoutes.routes,
  ];
}
