import 'package:get/get_connect.dart';

class WeatherApiProvider extends GetConnect {
  Future<Response> getWeatherApiTest() async => await get(
      "https://api.openweathermap.org/data/2.5/weather?q=London&appid=2f0cab5ca5237051f09bf2418e0d19f3");
}
