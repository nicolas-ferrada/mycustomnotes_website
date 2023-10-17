import 'package:flutter/widgets.dart';

class HomePageRightSide extends StatelessWidget {
  const HomePageRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/phones.png',
          fit: BoxFit.cover,
          width: 800,
        ),
      ],
    );
  }
}
