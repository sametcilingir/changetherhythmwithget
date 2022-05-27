import 'package:get/get_connect.dart';

import 'api_keys.dart';

class WeatherApiProvider extends GetConnect {
  Future<Response> getWeatherFromApiWithCityName(String cityName) async => await get(
      "https://pro.openweathermap.org/data/2.5/weather?q=$cityName&APPID=${ApiKeys.weather_api_key}&units=metric");
  Future<Response> getWeatherFromApiWithCityID(String cityID) async => await get(
      "https://pro.openweathermap.org/data/2.5/weather?id=$cityID&APPID=${ApiKeys.weather_api_key}&units=metric");
}
