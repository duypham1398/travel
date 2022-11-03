import 'package:flutter/cupertino.dart';
import 'package:travel/representation/screens/guest_and_room_screen.dart';
import 'package:travel/representation/screens/hotel_booking_screen.dart';
import 'package:travel/representation/screens/hotel_screen.dart';
import 'package:travel/representation/screens/intro_screen.dart';
import 'package:travel/representation/screens/main_app.dart';
import 'package:travel/representation/screens/profile_screen.dart';
import 'package:travel/representation/screens/select_date_screen.dart';
import 'package:travel/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
