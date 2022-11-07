import 'package:flutter/material.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/representation/widgets/appbar_container.dart';
import 'package:travel/representation/widgets/button_widget.dart';

import '../widgets/Item_add_guest_and_room.dart';

import '../widgets/Item_add_guest_and_room.dart';

class GuestAndRoomScreen extends StatelessWidget {
  // const GuestAndRoomScreen({Key? key}) : super(key: key);
  static final String routeName = '/guest_and_room_screen';
  int? numberGuest;
  int? numberRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Add guest and room',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 3,
          ),
          ItemAddGuestAndRoom(
            title: 'Guest',
            icon: AssetHelper.IconGuest1,
            initData: 2,
          ),
          SizedBox(
            height: kBottomBarIconSize,
          ),
          ItemAddGuestAndRoom(
              title: 'Room', icon: AssetHelper.IconRoom, initData: 1),
          SizedBox(height: 25),
          ButtonWidget(
            title: 'Done',
            ontap: () {
              Navigator.of(context).pop([]);
            },
          )
        ],
      ),
    );
  }
}
