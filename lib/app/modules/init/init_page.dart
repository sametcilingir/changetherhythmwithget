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
      body: Center(
          child: Column(
        children: [
          Obx(() {
            return Text("name: ${controller.weather.value.name}");
          }),
          Obx(() {
            return Text(
                "coords: ${controller.weather.value.coord?.lat} + ${controller.weather.value.coord?.lon} ");
          }),
          Obx(() {
            return Text(
                "weather: ${controller.weather.value.weather?.first.main}");
          }),
          ElevatedButton(
              onPressed: () async {
                await controller.getLocation();
              },
              child: Text("Get Location on api"))
        ],
      )),
    );
  }
}
