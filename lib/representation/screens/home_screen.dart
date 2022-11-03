import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';

// import 'package:travel/core/representation/screens/intro_screen.dart';

import '../widgets/appbar_container.dart';
import 'hotel_booking_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
            child: icon,
          ),
          SizedBox(height: kItemPadding),
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Jane',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: kMediumPadding),
                Text(
                  'Where are you going next?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kMediumPadding,
              color: Colors.white,
            ),
            SizedBox(width: kDefaultPadding),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kItemPadding)),
              padding: EdgeInsets.only(top: kMinPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.Avatar),
            )
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
                ),
                hintText: 'Search your destination',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultIconSize,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding)),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: [
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.IconHotel,
                          width: kMediumPadding, height: kMediumPadding),
                      ColorPalette.yellowColor, () {
                Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
              }, 'Hotel')),
              SizedBox(width: kDefaultPadding),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.IconPlane,
                          width: kMediumPadding, height: kMediumPadding),
                      ColorPalette.yellowColor,
                      () {},
                      'Flights')),
              SizedBox(width: kDefaultPadding),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.IconHotelPlane,
                          width: kMediumPadding, height: kMediumPadding),
                      ColorPalette.yellowColor,
                      () {},
                      'All')),
            ],
          )
        ],
      ),
    );
  }
}
