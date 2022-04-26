import 'package:get/get.dart';

class InitController extends GetxController {
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
