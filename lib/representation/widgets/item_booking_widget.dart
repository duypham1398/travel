import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/core/constants/dismension_constants.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      required this.onTap})
      : super(key: key);
  final String icon;
  final String title;
  final String description;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(kItemPadding),
            )),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 32,
              height: 32,
            ),
            SizedBox(width: kMediumPadding),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: kItemPadding,
                ),
                Text(
                  description,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
