import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  RegisterController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_right,
          color: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        onPressed: () async {
          await controller.getLocation();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                "Weather App",
                style: TextStyle(fontSize: 38),
              )),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                  "Welcome to the weather app, before you can use it, you need to register your location."),
            ),
            Expanded(
              flex: 2,
              child: Form(
                key: controller.formkey.value,
                child: TextFormField(
                  controller: controller.locationTexrEditingController.value,
                  decoration: const InputDecoration(
                    labelText: "Location",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a location";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
