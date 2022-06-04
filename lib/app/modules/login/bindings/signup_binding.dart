import 'package:get/get.dart';

import '../../../../app/modules/login/controller/login_controller.dart';
import '../../../../app/modules/login/screens/signup_screen.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupScreen>(
      () => SignupScreen(),
    );
  }
}
