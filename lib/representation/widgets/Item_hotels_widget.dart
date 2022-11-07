import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/representation/screens/detail_hotel_screen.dart';
import 'package:travel/representation/widgets/button_widget.dart';

import 'line_widget.dart';

class ItemHotelsWidget extends StatelessWidget {
  const ItemHotelsWidget({Key? key, required this.hotelModel})
      : super(key: key);
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kMediumPadding),
        ),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: 20),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          // SizedBox(height: kDefaultPadding),
          Padding(
            // padding: EdgeInsets.only(left: 20),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: kDefaultPadding),
                Row(children: [
                  Image.asset(AssetHelper.iconLocation),
                  SizedBox(width: kDefaultPadding),
                  Text(hotelModel.location),
                  Expanded(
                    child: Text(
                      ' - ${hotelModel.awayKilometer} from destination',
                      style: TextStyle(color: ColorPalette.subTitleColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ]),
                SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    Image.asset(AssetHelper.iconStar),
                    SizedBox(width: kDefaultPadding),
                    Text(hotelModel.star.toString()),
                    Text(' (${hotelModel.numberOfReview.toString()} reviews)')
                  ],
                ),
                LineWidget(),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            r'$' + hotelModel.price.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: kMediumPadding),
                          Text('/night'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ButtonWidget(
                        title: 'Book a room',
                        ontap: () {
                          Navigator.of(context)
                              .pushNamed(DetailHotelScreen.routeName);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
