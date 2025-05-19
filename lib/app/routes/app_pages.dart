// lib/app/routes/app_pages.dart
import 'package:smart_education/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';
import 'package:smart_education/onboarding_page.dart';
import 'package:smart_education/sign_in_page.dart';
import 'package:smart_education/sign_up_page.dart';
import 'package:smart_education/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInPage(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(username: Get.arguments ?? 'Guest'),
    ),
  ];
}
