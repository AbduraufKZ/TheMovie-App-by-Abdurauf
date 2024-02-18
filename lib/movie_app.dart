import 'package:flutflix/abstract_and_constants/colors.dart';
import 'package:flutflix/router/app_navigator.dart';
import 'package:flutflix/router/app_routes.dart';
import 'package:flutter/material.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.login, 
      routes: AppNavigator.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
      ),
      onGenerateRoute: (settings) {
        return null;
      },
    );
  }
}
