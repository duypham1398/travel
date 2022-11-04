import 'package:flutter/material.dart';
import 'package:travel/core/helper/asset_helper.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/representation/widgets/Item_hotels_widget.dart';
import 'package:travel/representation/widgets/appbar_container.dart';

class HotelScreen extends StatefulWidget {
  HotelScreen({Key? key}) : super(key: key);
  static final String routeName = '/hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final List<HotelModel> listHotel = [
    HotelModel(AssetHelper.imageHotel1, 'Royal Palm Heritage',
        'Purwokerto, Jateng', '364m ', 4.5, 3241, 143),
    HotelModel(AssetHelper.imageHotel2, 'Grand Luxury’s', 'Banyumas, Jateng',
        '2.3 km', 4.2, 2456, 234),
    HotelModel(AssetHelper.imageHotel3, 'The Orlando House',
        'Ajibarang, Jateng', '1.1 km', 3.8, 1234, 132)
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      implementTraling: true,
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children:
              listHotel.map((e) => ItemHotelsWidget(hotelModel: e)).toList(),
        ),
      ),
    );
  }
}
