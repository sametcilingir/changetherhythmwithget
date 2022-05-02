import 'package:changetherhythmwithget/app/data/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository.dart';

class RegisterController extends GetxController {
  WeatherRepository get weatherRepository => Get.find();

  var weather = WeatherModel().obs;

  var formkey = GlobalKey<FormState>().obs;

  var locationTexrEditingController = TextEditingController().obs;

  Future<void> getLocation() async {
    bool? val = formkey.value.currentState?.validate();
    if (val == true) {
      formkey.value.currentState?.save();
      String cityName = locationTexrEditingController
          .value.text; //.removeSpacesAndToLoweCase();

      weather.value = await weatherRepository.getWeather(cityName: cityName);
       

      if (weather.value.id == null) {
        locationTexrEditingController.value.clear();
        Get.snackbar(
          "Error",
          "Location not found",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
        );
      } else {
        Get.offAndToNamed("/home/${weather.value.id}", arguments: weather.value);
      }
    } else {
      locationTexrEditingController.value.clear();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    print("RegisterController initializing...");
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    print("RegisterController ready!");
  }

  @override
  void onClose() async {
    super.onClose();
    print("RegisterController closing...");
  }
}
