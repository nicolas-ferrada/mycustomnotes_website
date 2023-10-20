import 'package:flutter/widgets.dart';

class HomePageRightSide extends StatelessWidget {
  const HomePageRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        images(),
        const SizedBox(height: 64),
      ],
    );
  }

  Widget images() {
    return Row(
      children: [
        Image.asset(
          'assets/images/small-view.jpg',
          fit: BoxFit.cover,
          height: 600,
        ),
        const SizedBox(width: 32),
        Image.asset(
          'assets/images/split-view.jpg',
          fit: BoxFit.cover,
          height: 600,
        ),
      ],
    );
  }
}
