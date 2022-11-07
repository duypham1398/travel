import 'package:flutter/material.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/representation/widgets/appbar_container.dart';

import '../widgets/Item_add_guest_and_room.dart';

class GuestAndRoomScreen extends StatelessWidget {
  // const GuestAndRoomScreen({Key? key}) : super(key: key);
  static final String routeName = '/guest_and_room_screen';

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
          // ItemBookingWidget(
          //     icon: icon, title: title, description: description, onTap: onTap)
        ],
      ),
    );
  }
}
