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
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.initData;
    _textEditingController =
        TextEditingController(text: widget.initData.toString())
          ..addListener(() {
            number = int.parse(_textEditingController.text);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kTopPadding)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(kDefaultPadding),
      // padding: EdgeInsets.only(top: kMediumPadding),
      // margin: EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(widget.icon, height: 32, width: 32),
          SizedBox(width: kDefaultPadding),
          Text(
            widget.title,
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 1) {
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                });
              }
            },
            child: ImageHelper.loadFromAsset(AssetHelper.Icondeincrease,
                height: 32, width: 32),
          ),
          Container(
            height: 35,
            width: 60,
            padding: EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 18)),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              });
            },
            child: ImageHelper.loadFromAsset(AssetHelper.Iconincrease,
                height: 32, width: 32),
          ),
        ],
      ),
    );
  }
}
