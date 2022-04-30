import 'package:changetherhythmwithget/app/modules/init/init_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {

  @override
  HomeController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
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
            child: Text("Clear"),
            onPressed: () async {
              await controller.clearLocationFromStorage();
            },
          ),
          
          
        ],
      )),
    );
  }
}
