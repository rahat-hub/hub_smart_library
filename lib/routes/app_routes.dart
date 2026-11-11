import 'package:get/get.dart';
import '../views/splash/splash_screen.dart';
import '../views/login/login_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';

  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
