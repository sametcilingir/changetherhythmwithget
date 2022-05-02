import 'package:changetherhythmwithget/app/data/models/weather_model.dart';
import 'package:changetherhythmwithget/app/data/repositories/weather_repository.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class InitController extends GetxController with StateMixin {
  WeatherRepository get weatherRepository => Get.find();


  Future<void> getSavedLocations() async {
    change("Loading", status: RxStatus.loading());
    List<String> locationList =
        await weatherRepository.getAllWeathersFromStorage();
    if (locationList.isNotEmpty) {
      var weather =
          await weatherRepository.getWeather(cityID: locationList.last);
      if (weather.id != null) {
        await Get.offAndToNamed("/home/${weather.id}", arguments: weather);
        change("Başarılı", status: RxStatus.success());
      } else {
        await Get.offAndToNamed(AppPages.REGISTER);
        change("Can't find any location", status: RxStatus.empty());
      }
    } else {
      await Get.offAndToNamed(AppPages.REGISTER);
      change("Can't find any location", status: RxStatus.empty());
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    await getSavedLocations();
  }
}
