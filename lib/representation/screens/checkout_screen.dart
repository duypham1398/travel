import 'package:flutter/material.dart';
import 'package:travel/core/constants/color_constants.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/data/models/room_model.dart';
import 'package:travel/representation/widgets/appbar_container.dart';
import 'package:travel/representation/widgets/button_widget.dart';
import 'package:travel/representation/widgets/item_ultility_hotel_widget.dart';
import 'package:travel/representation/widgets/line_widget.dart';

import '../../core/helper/image_helper.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key, required this.roomModel}) : super(key: key);
  static const String routeName = '/checkout_screen';
  final RoomModel roomModel;
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<String> listStep = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemStepCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
              color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(kMediumPadding)),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(width: kMinPadding),
        Text(
          stepName,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: kMinPadding),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        SizedBox(width: kMinPadding),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
        titleString: 'Checkout',
        implementLeading: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: listStep
                    .map((e) => _buildItemStepCheckout(listStep.indexOf(e) + 1,
                        e, listStep.indexOf(e) == listStep.length - 1, true))
                    .toList(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: kDefaultPadding),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(kDefaultPadding),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                                      widget.roomModel.roomName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: kDefaultPadding),
                                    Text(
                                        'Room Size: ${widget.roomModel.roomS} m2'),
                                    SizedBox(height: kDefaultPadding),
                                    Text(widget.roomModel.roomContent)
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: ImageHelper.loadFromAsset(
                                  widget.roomModel.roomImage,
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
                                child: Row(
                                  children: [
                                    Text(
                                      r'$' +
                                          widget.roomModel.roomPrice.toString(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('/night'),
                                  ],
                                ),
                              ),
                              Text(
                                '1room',
                                textAlign: TextAlign.right,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(kDefaultPadding),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.iconUser,
                                  width: 32, height: 32),
                              SizedBox(width: 15),
                              Text(
                                'Contact Details',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorPalette.addItemCheckout,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Icon(Icons.add)),
                                SizedBox(width: 15),
                                Text(
                                  'Add Contact',
                                  style: TextStyle(
                                    color: ColorPalette.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(kDefaultPadding),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.iconPromo,
                                  width: 32, height: 32),
                              SizedBox(width: 15),
                              Text(
                                'Promo Code',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: ColorPalette.addItemCheckout,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Icon(Icons.add)),
                                SizedBox(width: 15),
                                Text(
                                  'Add Promo Code',
                                  style: TextStyle(
                                    color: ColorPalette.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ButtonWidget(title: 'Payment'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
