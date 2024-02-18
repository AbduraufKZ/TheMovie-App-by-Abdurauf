import 'package:flutflix/router/app_routes.dart';
import 'package:flutflix/screens/login_page.dart';
import 'package:flutflix/screens/home_screen.dart';
import 'package:flutter/widgets.dart';

class AppNavigator {
  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (context) => const LoginPage(),
    AppRoutes.home: (context) => const HomeScreen(),
    

  };
  static String get initRoute => AppRoutes.login;
}
 