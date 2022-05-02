import 'package:changetherhythmwithget/app/data/providers/api_keys.dart';
import 'package:get/get_connect.dart';

class WeatherApiProvider extends GetConnect {
  Future<Response> getWeatherFromApiWithCityName(String cityName) async => await get(
      "https://pro.openweathermap.org/data/2.5/weather?q=$cityName&APPID=${ApiKeys.weather_api_key}&units=metric");
  Future<Response> getWeatherFromApiWithCityID(String cityID) async => await get(
      "https://pro.openweathermap.org/data/2.5/weather?id=$cityID&APPID=${ApiKeys.weather_api_key}&units=metric");
}
