import 'package:get/get.dart';

import '../models/weather_model.dart';
import '../services/weather_api_service.dart';
import '../services/weather_storage_service.dart';

class WeatherRepository {
  WeatherApiService get weatherApiService => Get.find();
  WeatherStorageService get weatherStorageService => Get.find();

  Future<WeatherModel> getWeather({String? cityName, String? cityID}) async {
    if (cityName != null) {
      return await getWeatherFromApiWithCityName(cityName);
    }
    if (cityID != null) {
      var weatherFromStorage =
          await weatherStorageService.getWeatherFromStorage(cityID);
      if (weatherFromStorage.id == null) {
        return await getWeatherFromApiWithCityID(cityID);
      } else {
        return weatherFromStorage;
      }
    }

    return WeatherModel();
  }

  Future<WeatherModel> getWeatherFromApiWithCityName(String cityName) async {
    var weather =
        await weatherApiService.getWeatherFromApiWithCityName(cityName);
    if (weather.id != null) {
      await weatherStorageService.saveWeatherToStorage(weather);
      return weather;
    } else {
      return WeatherModel();
    }
  }

  Future<WeatherModel> getWeatherFromApiWithCityID(String cityID) async {
    var weather = await weatherApiService.getWeatherFromApiWithCityID(cityID);
    if (weather.id != null) {
      await weatherStorageService.saveWeatherToStorage(weather);
      return weather;
    } else {
      return WeatherModel();
    }
  }

  Future<List<String>> getAllWeathersFromStorage() async {
    var locations = await weatherStorageService.getAllWeathersFromStorage();
    if (locations.isNotEmpty) {
      return locations;
    } else {
      return [];
    }
  }

  Future<void> removeWeatherFromStorage(WeatherModel weatherModel) async {
    await weatherStorageService.removeWeatherFromStorage(weatherModel);
  }

  Future<void> clearAllWeathersFromStorage() async {
    await weatherStorageService.clearAllWeathersFromStorage();
  }
}
