import 'package:changetherhythmwithget/app/data/extensions/string_extension.dart';
import 'package:changetherhythmwithget/app/data/models/weather_model.dart';
import 'package:changetherhythmwithget/app/data/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class InitController extends GetxController with StateMixin {
  WeatherRepository get weatherRepository => Get.find();

  //Todo home git meden storage da bulmadan burada kaydediyor, olsa bile api ye gidiyor

  Future<void> getSavedLocations() async {
    change("Loading", status: RxStatus.loading());
    List<String> locationList = await weatherRepository.getAllLocations();
    if (locationList.isNotEmpty) {
      print("locationList: ${locationList}");
      WeatherModel weather =
          await weatherRepository.getLocation(locationList.last);

      var weatherName = weather.name?.toLowerCase();

      print("Weather: ${weatherName}");

      Get.offAndToNamed("/home/$weatherName");
      change("Başarılı", status: RxStatus.success());
    } else {
      Get.offAndToNamed(AppPages.REGISTER);
      change("Hata", status: RxStatus.error());
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getSavedLocations();
  }
}
