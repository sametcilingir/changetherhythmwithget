import 'package:changetherhythmwithget/app/data/models/weather_model.dart';
import 'package:changetherhythmwithget/app/data/services/weather_api_service.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  WeatherApiService get weatherApiService => Get.find();

  var weather = WeatherModel().obs;

  Future<void> getLocation() async {
    weather.value = await weatherApiService.getWeatherApiTest();
    print(weather.value.toJson());
  }

  @override
  void onInit() {
    super.onInit();
    print("InitController initializing...");
  }

  @override
  void onReady() {
    super.onReady();
    print("InitController ready!");
  }

  @override
  void onClose() {
    super.onClose();
    print("InitController closing...");
  }
}
