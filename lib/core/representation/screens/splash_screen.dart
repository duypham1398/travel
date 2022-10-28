import 'package:flutter/material.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routerName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ImageHelper.loadFromAsset(AssetHelper.imageBackgroundSplash)],
    );
  }
}
