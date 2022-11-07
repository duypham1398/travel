import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';
import 'package:travel/data/models/hotel_model.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({Key? key, required this.hotelModel})
      : super(key: key);
  static final String routeName = '/detail_hotel_screen';
  final HotelModel hotelModel;
  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  Color heartColor = ColorPalette.heartColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.imageHotelDetail,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 2,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
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
            ),
          ),
          Positioned(
            top: kMediumPadding * 2,
            right: kMediumPadding,
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(kItemPadding),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: heartColor,
                  size: kDefaultPadding,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kItemPadding),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
