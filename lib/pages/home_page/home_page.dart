import 'package:flutter/material.dart';

import 'home_page_widgets/home_page_left_side.dart';
import 'home_page_widgets/home_page_right_side.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HomePageLeftSide(),
        HomePageRightSide(),
      ],
    );
  }
}
