import 'package:changetherhythmwithget/app/data/models/weather_model.dart';
import 'package:changetherhythmwithget/app/data/services/weather_api_service.dart';
import 'package:changetherhythmwithget/app/data/services/weather_storage_service.dart';
import 'package:get/get.dart';

class WeatherRepository {
  WeatherApiService get weatherApiService => Get.find();
  WeatherStorageService get weatherStorageService => Get.find();

  Future<WeatherModel> getLocation(String location) async {
    final weather = await getLocationFromStorage(location);
    if (weather.name != null) {
      print("Weather from storage");
      return weather;
    } else {
      final weather = await getLocationFromApi(location);
      if (weather.name != null) {
        print("Weather from api");
        await weatherStorageService.saveWeatherToStorage(weather);
        print("Weather saved to storage");
        return weather;
      } else {
        return WeatherModel();
      }
    }
  }

  Future<WeatherModel> getLocationFromStorage(String location) async {
    final weather = await weatherStorageService.getWeatherFromStorage(location);
    if (weather.name == null) {
      return WeatherModel();
    } else {
      return weather;
    }
  }

  Future<WeatherModel> getLocationFromApi(String location) async {
    final weather = await weatherApiService.getWeatherApi(location);
    if (weather.name == null) {
      return WeatherModel();
    } else {
      return weather;
    }
  }

  Future<List<String>> getAllLocations() async {
    return await weatherStorageService.getAllLocationsFromStorage();
  }

  

  Future<void> clearLocations() async {
    await weatherStorageService.clearLocationsFromStorage();
  }
}
