import 'package:flutter/material.dart';
import 'package:travel/core/constants/dismension_constants.dart';
import 'package:travel/core/extensions/date_ext.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/representation/screens/guest_and_room_screen.dart';
import 'package:travel/representation/screens/select_date_screen.dart';
import 'package:travel/representation/widgets/appbar_container.dart';
import 'package:travel/representation/widgets/button_widget.dart';
import 'package:travel/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);
  static final String routeName = '/hotel_booking_screen';
  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kMediumPadding * 3),
            ItemBookingWidget(
              icon: AssetHelper.IconLocation,
              title: 'Destination',
              description: 'South Korea',
              onTap: () {},
            ),
            SizedBox(height: kMediumPadding),
            StatefulBuilder(builder: (context, setState) {
              return ItemBookingWidget(
                icon: AssetHelper.IconCalendar,
                title: 'Select Date',
                description: dateSelected ?? '13 Feb - 18 Feb 2021',
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDateScreen.routeName);
                  if ((result as List<DateTime?>)
                      .any((element) => element != null)) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(() {});
                  }
                },
              );
            }),
            SizedBox(height: kMediumPadding),
            ItemBookingWidget(
              icon: AssetHelper.IconGuest,
              title: 'Guest and Room',
              description: '2 Guest, 1 Room',
              onTap: () {
                Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
              },
            ),
            SizedBox(height: kMediumPadding),
            ButtonWidget(title: 'Search')
          ],
        ),
      ),
    );
  }
}
