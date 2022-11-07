import 'package:flutter/material.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({Key? key}) : super(key: key);
  static final String routeName = '/detail_hotel_screen';
  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('ad'),
    ));
  }
}
