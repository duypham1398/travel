import 'package:flutter/material.dart';
class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);
  static final String routeName = '/hotel_screen';
  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('abc'),
      ),
    );
  }
}
