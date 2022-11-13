import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/image_helper.dart';

class ImgHomeWidget extends StatefulWidget {
  const ImgHomeWidget({Key? key, required this.imageHome}) : super(key: key);
  final String imageHome;

  @override
  State<ImgHomeWidget> createState() => _ImgHomeWidgetState();
}

class _ImgHomeWidgetState extends State<ImgHomeWidget> {
  Color heartColor = ColorPalette.heartColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Stack(
        children: [
          Positioned(
            child: ImageHelper.loadFromAsset(widget.imageHome,
                radius: BorderRadius.all(Radius.circular(kDefaultPadding))),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
                onTap: () {
                  if (heartColor == ColorPalette.heartColor) {
                    setState(() {
                      heartColor = Colors.red;
                    });
                  } else {
                    setState(() {
                      heartColor = ColorPalette.heartColor;
                    });
                  }
                  ;
                },
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: heartColor,
                )),
          ),
        ],
      ),
    );
  }
}
