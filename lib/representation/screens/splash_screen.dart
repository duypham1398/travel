import 'package:flutter/material.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';
import 'package:travel/core/helper/local_storage_helper.dart';
import 'package:travel/representation/screens/intro_screen.dart';
import 'package:travel/representation/screens/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routerName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectItroScreen();
  }

  void redirectItroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;
    await Future.delayed(const Duration(seconds: 2));
    if (ignoreIntroScreen != null && ignoreIntroScreen) {
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.imageBackgroundSplash,
              fit: BoxFit.fitWidth),
        ),
        Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.imageCircleSplash))
      ],
    );
  }
}
