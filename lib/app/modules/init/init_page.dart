import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'init_controller.dart';

class InitPage extends GetView<InitController> {
  const InitPage({Key? key}) : super(key: key);

  @override
  InitController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Init Page"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InitPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
