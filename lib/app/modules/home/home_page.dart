import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  HomeController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${controller.weather.value.name}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(
                            (controller.weather.value.main!.temp!)
                                    .toInt()
                                    .toString() +
                                "°C",
                            style: const TextStyle(
                                fontSize: 92,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await controller.refreshWeather();
                          },
                          icon: const Icon(Icons.refresh),
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                              "${controller.weather.value.weather!.first.main}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(
                flex: 6,
                child: FlutterLogo(
                  size: 250,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${controller.weather.value.main!.humidity}%",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          const Text("Humidity",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text((controller.weather.value.visibility!~/1000).toString()+" KM",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          const Text("Visibility",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${controller.weather.value.main!.pressure}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          const Text("Pressure",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    controller.clearLocationFromStorage();
                  },
                  child: const Text(
                    "Change Location",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
