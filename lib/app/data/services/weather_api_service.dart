import 'package:get/get.dart';

import '../models/weather_model.dart';
import '../providers/weather_api_provider.dart';

class WeatherApiService extends GetxService {
  WeatherApiProvider get weatherApiProvider => Get.find();

  Future<WeatherModel> getWeatherFromApiWithCityName(String cityName) async {
    try {
      var response =
          await weatherApiProvider.getWeatherFromApiWithCityName(cityName);
      var weather = WeatherModel.fromJson(await response.body);
      return weather;
    } catch (e) {
      print(e);
      return WeatherModel();
    }
  }

  Future<WeatherModel> getWeatherFromApiWithCityID(String cityID) async {
    try {
      var response =
          await weatherApiProvider.getWeatherFromApiWithCityID(cityID);
      var weather = WeatherModel.fromJson(response.body);
      return weather;
    } catch (e) {
      print(e);
      return WeatherModel();
    }
  }
}
