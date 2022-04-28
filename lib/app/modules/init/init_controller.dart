import 'package:changetherhythmwithget/app/data/extensions/string_extension.dart';
import 'package:changetherhythmwithget/app/data/models/weather_model.dart';
import 'package:changetherhythmwithget/app/data/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  WeatherRepository get weatherRepository => Get.find();

  var weather = WeatherModel().obs;

  var locationList = <String>[].obs;

  var formkey = GlobalKey<FormState>().obs;

  var locationTexrEditingController = TextEditingController().obs;

  Future<void> getLocation() async {
    bool? val = formkey.value.currentState?.validate();
    if (val == true) {
      formkey.value.currentState?.save();
      String? location =
          locationTexrEditingController.value.text.capitalizeOnlyFirst();

      weather.value = await weatherRepository.getLocation(location);
      if (weather.value.name != null) {
        locationList.contains(weather.value.name) == false
            ? locationList.add(weather.value.name!)
            : null;
      }

      print("locationList: ${locationList}");

      locationTexrEditingController.value.clear();
    }
  }

  Future<void> getSavedLocations() async {
    print("getSavedLocations");
    locationList.value = await weatherRepository.getAllLocations();
    if (locationList.isNotEmpty) {
      print("locationList: ${locationList}");
      weather.value = await weatherRepository.getLocation(locationList.last);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    print("InitController initializing...");
    getSavedLocations();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    print("InitController ready!");
  }

  @override
  void onClose() async {
    super.onClose();
    print("InitController closing...");
  }
}
