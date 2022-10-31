import 'package:flutter/cupertino.dart';
import 'package:travel/core/representation/screens/intro_screen.dart';
import 'package:travel/core/representation/screens/main_app.dart';
import 'package:travel/core/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
};
