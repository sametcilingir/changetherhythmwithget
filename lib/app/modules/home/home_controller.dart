import 'package:changetherhythmwithget/app/data/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository.dart';
import '../../routes/app_pages.dart';

class HomeController extends GetxController {
  WeatherRepository get weatherRepository => Get.find();

  var weather = WeatherModel().obs;

  //var locationList = <String>[].obs;

  Future<void> refreshWeather() async {
    try {
      weather.value = await weatherRepository
          .getWeatherFromApiWithCityID(weather.value.id.toString());
      Get.snackbar(
          "Updated",
          "Weather has been updated successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
        );
    } catch (e) {
      print(e);
    }
  }

  Future<void> getWeatherFromRoute() async {
    var weatherModelFromRoute = Get.arguments;
    if (weatherModelFromRoute != null) {
      weather.value = weatherModelFromRoute;
    } else {
      String cityID = Get.parameters['cityID']!;
      weather.value = await weatherRepository.getWeather(cityID: cityID);
    }
  }

  Future<void> clearLocationFromStorage() async {
    await weatherRepository.clearAllWeathersFromStorage();
    Get.offAndToNamed(AppPages.INITIAL);
  }

  /* Future<void> getSavedLocations() async {
    print("getSavedLocations");
    locationList.value = await weatherRepository.getAllLocations();
    if (locationList.isNotEmpty) {
      print("locationList: ${locationList}");
      weather.value = await weatherRepository.getLocation(locationList.last);
    }
  }*/

  @override
  Future<void> onInit() async {
    super.onInit();
    await getWeatherFromRoute();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
