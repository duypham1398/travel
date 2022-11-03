import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom(
      {Key? key,
      required this.title,
      required this.icon,
      required this.initData})
      : super(key: key);

  final String title;
  final String icon;
  final int initData;

  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kTopPadding)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: kMediumPadding),
      margin: EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(AssetHelper.IconGuest1),
          SizedBox(width: kDefaultPadding),
          Text(widget.title),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: ImageHelper.loadFromAsset(AssetHelper.Icondeincrease),
          ),
          GestureDetector(
            onTap: () {},
            child: ImageHelper.loadFromAsset(AssetHelper.Iconincrease),
          ),
        ],
      ),
    );
  }
}
