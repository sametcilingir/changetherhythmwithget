import 'package:changetherhythmwithget/app/data/providers/api_keys.dart';
import 'package:get/get_connect.dart';

class WeatherApiProvider extends GetConnect {
  Future<Response> getWeatherApi(String location) async => await get(
      "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=${ApiKeys.weather_api_key}");
}
