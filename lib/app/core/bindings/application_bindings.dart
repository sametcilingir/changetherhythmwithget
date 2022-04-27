import 'package:changetherhythmwithget/app/data/providers/weather_api_provider.dart';
import 'package:changetherhythmwithget/app/data/services/weather_api_service.dart';
import 'package:changetherhythmwithget/app/modules/init/init_binding.dart';
import 'package:get/get.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    print("ApplicationBindings initializing...");
    
    Get.lazyPut<WeatherApiProvider>(
      WeatherApiProvider.new,
    );

    Get.lazyPut<WeatherApiService>(
      WeatherApiService.new,
    );
  }
}
