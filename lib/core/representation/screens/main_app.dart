import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';

import 'home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  static String routeName = '/main_app';
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _currentIndex,
          children: [
            HomeScreen(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
          margin: EdgeInsets.symmetric(
              vertical: kDefaultPadding, horizontal: kMediumPadding),
          items: [
            SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.house, size: kDefaultPadding),
                title: Text('Home')),
            SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.solidHeart, size: kDefaultPadding),
                title: Text('Like')),
            SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.briefcase, size: kDefaultPadding),
                title: Text('Booking')),
            SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.solidUser, size: kDefaultPadding),
                title: Text('User')),
          ],
        ));
  }
}
