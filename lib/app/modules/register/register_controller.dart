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
      String? location =
          locationTexrEditingController.value.text.capitalizeOnlyFirst();

      weather.value = await weatherRepository.getLocation(location);
      if (weather.value.name == null) {
        debugPrint("Weather is null");
        locationTexrEditingController.value.clear();
        Get.snackbar(
          "Error",
          "Location not found",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      } else {
        Get.offAndToNamed("/home/${weather.value.name}");
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
