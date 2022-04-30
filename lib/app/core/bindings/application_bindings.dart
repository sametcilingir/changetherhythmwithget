import 'package:changetherhythmwithget/app/data/providers/weather_api_provider.dart';
import 'package:changetherhythmwithget/app/data/repositories/weather_repository.dart';
import 'package:changetherhythmwithget/app/data/services/weather_api_service.dart';
import 'package:changetherhythmwithget/app/data/services/weather_storage_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


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
