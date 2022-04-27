import 'package:get/get.dart';

import '../models/weather_model.dart';
import '../providers/weather_api_provider.dart';

class WeatherApiService extends GetxService {

  WeatherApiProvider get weatherApiProvider => Get.find();

  Future<WeatherModel> getWeatherApiTest() async {
    try {
      final response = await weatherApiProvider.getWeatherApiTest();
      final weather = WeatherModel.fromJson(response.body);
      return weather;
    } catch (e) {
      print(e);
      return WeatherModel();
    }
  }
}
