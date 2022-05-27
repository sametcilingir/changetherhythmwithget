import 'package:get/get.dart';

import '../../data/repositories/weather_repository.dart';
import '../../routes/app_pages.dart';

class InitController extends GetxController with StateMixin {
  WeatherRepository get weatherRepository => Get.find();

  Future<void> getSavedLocations() async {
    change("Loading", status: RxStatus.loading());
    var locationList = await weatherRepository.getAllWeathersFromStorage();
    if (locationList.isNotEmpty) {
      var weather =
          await weatherRepository.getWeather(cityID: locationList.last);
      if (weather.id != null) {
        change("Success", status: RxStatus.success());
        await Get.offAndToNamed("${AppPages.HOME}/${weather.id}", arguments: weather);
      } else {
        change("Can't find any location", status: RxStatus.empty());
        await Get.offAndToNamed(AppPages.REGISTER);
      }
    } else {
      change("Can't find any location", status: RxStatus.empty());
      await Get.offAndToNamed(AppPages.REGISTER);
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    await getSavedLocations();
  }
}
