import 'package:get/get.dart';

import '../screens/screen.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Screen>(
      () => Screen(),
    );
  }
}
