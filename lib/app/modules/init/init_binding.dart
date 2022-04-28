import 'package:get/get.dart';

import 'init_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitController>(
      InitController.new,
    );
    print("InitBinding initializing...");
    
  }
}
