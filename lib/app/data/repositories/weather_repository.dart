import 'package:changetherhythmwithget/app/data/models/weather_model.dart';
import 'package:changetherhythmwithget/app/data/services/weather_api_service.dart';
import 'package:changetherhythmwithget/app/data/services/weather_storage_service.dart';
import 'package:get/get.dart';

class WeatherRepository {
  WeatherApiService get weatherApiService => Get.find();
  WeatherStorageService get weatherStorageService => Get.find();

  Future<WeatherModel> getWeather({String? cityName, String? cityID}) async {
    if (cityName != null) {
      //city name sadece registerdan gelir ve kaydedilmesi gerekir
      return await getWeatherFromApiWithCityName(cityName);
    }
    if (cityID != null) {
      //city id var ise storage da var mı yok mu sorgulamak gerekir
      var weatherFromStorage = await getWeatherFromStorage(cityID);
      if (weatherFromStorage.id == null) {
        //storage da yok ise api den çek ve kaydet
        return await getWeatherFromApiWithCityID(cityID);
      } else {
        //storage da var ise direk olarak döndür
        return weatherFromStorage;
      }
    }

    return WeatherModel();
  }


  Future<WeatherModel> getWeatherFromApiWithCityName(String cityName) async {
    try {
      var weather =
          await weatherApiService.getWeatherFromApiWithCityName(cityName);
      await weatherStorageService.saveWeatherToStorage(weather);
      return weather;
    } catch (e) {
      print(e);
      return WeatherModel();
    }
  }

  Future<WeatherModel> getWeatherFromApiWithCityID(String cityID) async {
    try {
      var weather = await weatherApiService.getWeatherFromApiWithCityID(cityID);
      await weatherStorageService.saveWeatherToStorage(weather);
      return weather;
    } catch (e) {
      print(e);
      return WeatherModel();
    }
  }

  Future<WeatherModel> getWeatherFromStorage(String cityID) async {
    try {
      var weather = await weatherStorageService.getWeatherFromStorage(cityID);
      return weather;
    } catch (e) {
      print(e);
      return WeatherModel();
    }
  }

  Future<List<String>> getAllWeathersFromStorage() async {
    try {
      var locations = await weatherStorageService.getAllWeathersFromStorage();
      return locations;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> removeWeatherFromStorage(WeatherModel weatherModel) async {
    try {
      await weatherStorageService.removeWeatherFromStorage(weatherModel);
    } catch (e) {
      print(e);
    }
  }

  Future<void> clearAllWeathersFromStorage() async {
    try {
      await weatherStorageService.clearAllWeathersFromStorage();
    } catch (e) {
      print(e);
    }
  }
}
