import 'package:flutter/material.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/core/helper/image_helper.dart';

class ItemUltilityHotelWidget extends StatelessWidget {
  ItemUltilityHotelWidget({Key? key}) : super(key: key);
  final List<Map<String, String>> listUltility = [
    {
      'icon': AssetHelper.iconFreeWifi,
      'name': 'Free\nWifi',
    },
    {
      'icon': AssetHelper.iconRefun,
      'name': 'Non-\nRefundable',
    },
    {
      'icon': AssetHelper.iconBreakfast,
      'name': 'Free\nBreakfast',
    },
    {
      'icon': AssetHelper.iconNonSmoking,
      'name': 'Non-\nSmoking',
    },
  ];

  Widget _buildItemUltility(String icon, String name) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        SizedBox(height: kDefaultPadding),
        Text(
          name,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listUltility
              .map((e) => _buildItemUltility(e['icon']!, e['name']!))
              .toList()),
    );
  }
}
