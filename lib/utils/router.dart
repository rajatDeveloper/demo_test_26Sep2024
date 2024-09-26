import 'package:flutter/material.dart';
import 'package:test_app/features/auth/presentation/pages/landing_page.dart';
import 'package:test_app/features/auth/presentation/pages/login_page.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> appRoutes = {
    LandingPage.routeName: (context) => const LandingPage(),
    LoginPage.routeName: (context) => const LoginPage(),
  };

  return appRoutes;
}
