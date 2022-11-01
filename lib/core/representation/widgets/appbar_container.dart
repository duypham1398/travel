import 'package:flutter/material.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({Key? key}) : super(key: key);

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
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(35)),
                    ),
                  ),
                  Positioned(
                      child: ImageHelper.loadFromAsset(AssetHelper.imageOval1)),
                  Positioned(
                      child: ImageHelper.loadFromAsset(AssetHelper.imageOval2))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
