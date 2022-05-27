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
      String cityName = locationTexrEditingController.value.text;

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
        Get.offAndToNamed("/home/${weather.value.id}",
            arguments: weather.value);
      }
    } else {
      locationTexrEditingController.value.clear();
    }
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    locationTexrEditingController.value.dispose();
  }
}
