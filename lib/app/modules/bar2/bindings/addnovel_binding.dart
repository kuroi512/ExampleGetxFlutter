import 'package:get/get.dart';

import '../screens/screen.dart';

class AddnovelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnovelScreen>(
      () => AddnovelScreen(),
    );
  }
}
