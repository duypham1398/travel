import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/constants/textstyle_constant.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';
import 'package:travel/representation/screens/main_app.dart';
import 'package:travel/representation/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: alignment,
            child: ImageHelper.loadFromAsset(image,
                height: 425, fit: BoxFit.fitHeight)),
        SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: kMediumPadding * 2,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                  AssetHelper.imageIntro1,
                  "Book a flight",
                  "Found a flight that matches your destination and schedule? Book it instantly",
                  Alignment.centerRight),
              _buildItemIntroScreen(
                  AssetHelper.imageIntro3,
                  "Find a hotel room",
                  "Select the day, book your room. We give you the best price.",
                  Alignment.center),
              _buildItemIntroScreen(
                  AssetHelper.imageIntro2,
                  "Enjoy your trip",
                  "Easy discovering new places and share these between your friends and travel together.",
                  Alignment.bottomLeft)
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    // axisDirection: Axis.vertical,
                    effect: const ExpandingDotsEffect(
                        radius: 4.0,
                        dotWidth: kMinPadding,
                        dotHeight: kMinPadding,
                        dotColor: ColorPalette.notchooseColor,
                        activeDotColor: ColorPalette.yellowColor),
                  ),
                ),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 4,
                        child: ButtonWidget(
                          title: snapshot.data != 2 ? 'Next' : 'Get Started',
                          ontap: () {
                            if (_pageController.page != 2) {
                              _pageController.nextPage(
                                  duration: Duration(microseconds: 200),
                                  curve: Curves.easeIn);
                            } else {
                              Navigator.of(context)
                                  .pushNamed(MainApp.routeName);
                            }
                          },
                        ),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
