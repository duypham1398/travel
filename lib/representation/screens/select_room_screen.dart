import 'package:flutter/material.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/data/models/room_model.dart';
import 'package:travel/representation/widgets/appbar_container.dart';
import 'package:travel/representation/widgets/item_select_room_widget.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);
  static const String routeName = '/select_room_screen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
        'Deluxe Room', '27', 'Free Cancellation', 245, AssetHelper.imageRoom1),
    RoomModel(
        'Executive Suite', '32', 'Non-refundable', 289, AssetHelper.imageRoom2),
    RoomModel('King Bed Only Room', '24', 'Non-refundable', 214,
        AssetHelper.imageRoom3),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select Room',
      child: SingleChildScrollView(
        child: Column(
          children: listRoom.map((e) => ItemRoomWidget(roomModel: e)).toList(),
        ),
      ),
    );
  }
}
