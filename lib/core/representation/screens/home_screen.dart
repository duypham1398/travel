import 'package:flutter/material.dart';

import '../widgets/appbar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Home',
      implementLeading: true,
      child: Container(
        color: Colors.yellow,
      ),
    );
  }
}
