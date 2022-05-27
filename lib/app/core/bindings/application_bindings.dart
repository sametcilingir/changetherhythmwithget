import 'package:get/get.dart';

import '../../data/providers/weather_api_provider.dart';
import '../../data/repositories/weather_repository.dart';
import '../../data/services/weather_api_service.dart';
import '../../data/services/weather_storage_service.dart';


class ApplicationBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    print("ApplicationBindings initializing...");

    Get.put<WeatherApiProvider>(
      WeatherApiProvider(),
    );

    Get.put<WeatherApiService>(
      WeatherApiService(),
    );

    Get.put<WeatherStorageService>(
      WeatherStorageService(),
    );

    Get.put<WeatherRepository>(
      WeatherRepository(),
    );
    
  }
}
