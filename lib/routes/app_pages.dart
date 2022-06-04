import 'package:get/get_navigation/src/routes/get_route.dart';
import '../app/modules/bar1/bindings/search_binding.dart';
import '../app/modules/bar1/screens/search_screen.dart';
import '../app/modules/bar2/bindings/addnovel_binding.dart';
import '../app/modules/bar2/screens/screen.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/home/home_view.dart';
import '../app/modules/login/bindings/login_binding.dart';
import '../app/modules/login/bindings/signup_binding.dart';
import '../app/modules/login/screens/login_screen.dart';
import '../app/modules/login/screens/signup_screen.dart';
import '../app/modules/onboard/splash_screen.dart';

import '../app/modules/profile/profile_screen.dart';
import '../app/modules/profile/bindings/profile_binding.dart';

import '../app/auth_middleware.dart';
import '../app/modules/root/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;
  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.INTRO,
          page: () => SplashScreen(),
          //binding: IntroBinding(),
        ),
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: _Paths.LOGIN,
          page: () => LoginScreen(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: _Paths.SIGNUP,
          page: () => SignupScreen(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: _Paths.SEARCH,
          page: () => SearchScreen(),
          binding: SearchBinding(),
        ),
        GetPage(
          name: _Paths.ADDNOVEL,
          page: () => AddnovelScreen(),
          binding: AddnovelBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => ProfileScreen(),
          binding: ProfileBinding(),
        ),
      ],
    )
  ];
}
