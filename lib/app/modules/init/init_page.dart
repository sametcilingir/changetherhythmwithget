import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'init_controller.dart';

class InitPage extends GetView<InitController> {
  const InitPage({super.key});

  @override
  InitController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Center(
          child: Text(state),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: const Center(
          child: Text('No data found'),
        ),
        onError: (error) => Center(
          child: Text(error ?? 'Error'),
        ),
      ),
    );
  }
}
