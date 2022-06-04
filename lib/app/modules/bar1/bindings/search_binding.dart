import 'package:get/get.dart';

import '../screens/search_screen.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchScreen>(
      () => SearchScreen(),
    );
  }
}
