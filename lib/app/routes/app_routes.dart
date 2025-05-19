import 'package:flutter/material.dart';
import 'package:smart_education/app/modules/splash/views/splash_view.dart';

import 'package:smart_education/onboarding_page.dart';
import 'package:smart_education/sign_in_page.dart';
import 'package:smart_education/sign_up_page.dart';
import 'package:smart_education/home_page.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const home = '/home';

  static Map<String, Widget Function(BuildContext)> get routes => {
        splash: (context) => SplashView(),
        onboarding: (context) => OnboardingPage(),
        signIn: (context) => SignInPage(),
        signUp: (context) => SignUpPage(),
        home: (context) => HomePage(username: 'Guest'),
      };
}
