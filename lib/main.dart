import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/bindings/application_bindings.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init().then((value) => print("GetStorage initialized"));

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
