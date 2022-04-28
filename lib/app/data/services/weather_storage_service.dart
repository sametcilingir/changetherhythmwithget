import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/weather_model.dart';

class WeatherStorageService extends GetxService {
  final box = GetStorage();

  Future<void> saveWeatherToStorage(WeatherModel weatherModel) async {
    try {
      await box.write("${weatherModel.name}", weatherModel);
    } catch (e) {
      print(e);
    }
  }

  Future<WeatherModel> getWeatherFromStorage(String location) async {
    try {
      final weather = await box.read(location);
      return weather;
    } catch (e) {
      print(e);
      return WeatherModel();
    }
  }

  Future<void> removeWeatherFromStorage(WeatherModel weatherModel) async {
    try {
      await box.remove("${weatherModel.name}");
    } catch (e) {
      print(e);
    }
  }

  Future<List<String>> getAllLocationsFromStorage() async {
    try {
      Iterable<String> valueKeys = box.getKeys();
      return valueKeys.toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> clearLocationsFromStorage() async {
    try {
      await box.erase();
    } catch (e) {
      print(e);
    }
  }
}
