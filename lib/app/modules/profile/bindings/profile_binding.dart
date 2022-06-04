import 'package:get/get.dart';
import '../../../../app/modules/profile/profile_screen.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileScreen>(
      () => ProfileScreen(),
    );
  }
}
