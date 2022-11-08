import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/representation/screens/detail_hotel_screen.dart';
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
  HotelScreen.routeName: (context) => HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  // DetailHotelScreen.routeName: (context) => DetailHotelScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  if (settings.name == DetailHotelScreen.routeName) {
    return MaterialPageRoute(builder: (context) {
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return DetailHotelScreen(
        hotelModel: hotelModel,
      );
    });
  }
}
