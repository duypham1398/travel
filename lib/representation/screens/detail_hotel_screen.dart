import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/representation/screens/select_room_screen.dart';
import 'package:travel/representation/widgets/button_widget.dart';
import 'package:travel/representation/widgets/line_widget.dart';

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
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  widget.hotelModel.hotelName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Text(
                                      r'$' + widget.hotelModel.price.toString(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('/night')
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                AssetHelper.iconLocation,
                              ),
                              SizedBox(width: kDefaultPadding),
                              Text(
                                widget.hotelModel.location,
                              ),
                            ],
                          ),
                          LineWidget(),
                          Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Image.asset(AssetHelper.iconStar),
                                      SizedBox(width: kDefaultPadding),
                                      Text(widget.hotelModel.star.toString() +
                                          '/5'),
                                      Text(
                                          ' (${widget.hotelModel.numberOfReview.toString()} reviews)')
                                    ],
                                  )),
                              Expanded(
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorPalette.primaryColor),
                                ),
                              )
                            ],
                          ),
                          LineWidget(),
                          Text(
                            'Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.',
                          ),
                          // SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  AssetHelper.iconRestaurant,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(AssetHelper.iconWifi),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(AssetHelper.iconExchange),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(AssetHelper.iconReception),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(AssetHelper.iconMore),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Restaurant',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Wifi',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Currency Exchange',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    '24-hour Front Desk',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'More',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: kMediumPadding),
                          Text(
                            'Location',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.',
                          ),
                          SizedBox(height: kMediumPadding),
                          ImageHelper.loadFromAsset(AssetHelper.imageMaps),
                          SizedBox(height: kMediumPadding),
                          ButtonWidget(
                            title: 'Select Room',
                            ontap: () {
                              Navigator.of(context)
                                  .pushNamed(SelectRoomScreen.routeName);
                            },
                          ),
                          SizedBox(height: kMediumPadding),
                        ],
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
