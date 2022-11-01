import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer(
      {Key? key,
      required this.child,
      this.title,
      this.titleString,
      this.implementLeading = false})
      : super(key: key);
  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultPadding),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                            size: kDefaultPadding,
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                titleString ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: ImageHelper.loadFromAsset(AssetHelper.Ovaltop)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: ImageHelper.loadFromAsset(AssetHelper.Ovalbot))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          )
        ],
      ),
    );
  }
}
