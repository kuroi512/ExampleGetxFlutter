import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/root/root_binding.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExampleGetx',
      initialBinding: RootBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
