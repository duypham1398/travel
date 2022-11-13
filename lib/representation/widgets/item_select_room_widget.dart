import 'package:flutter/material.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/image_helper.dart';
import 'package:travel/data/models/room_model.dart';
import 'package:travel/representation/screens/checkout_screen.dart';
import 'package:travel/representation/widgets/button_widget.dart';
import 'package:travel/representation/widgets/item_ultility_hotel_widget.dart';
import 'package:travel/representation/widgets/line_widget.dart';

class ItemRoomWidget extends StatelessWidget {
  const ItemRoomWidget({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roomModel.roomName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                      Text('Room Size: ${roomModel.roomS} m2'),
                      SizedBox(height: kDefaultPadding),
                      Text(roomModel.roomContent)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageHelper.loadFromAsset(
                    roomModel.roomImage,
                    radius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            ItemUltilityHotelWidget(),
            LineWidget(),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        r'$' + roomModel.roomPrice.toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kMediumPadding),
                      Text('/night'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ButtonWidget(
                    title: 'Choose',
                    ontap: () {
                      Navigator.of(context).pushNamed(CheckOutScreen.routeName,
                          arguments: roomModel);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
