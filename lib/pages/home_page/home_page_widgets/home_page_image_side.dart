import 'package:flutter/widgets.dart';

class HomePageImageSide extends StatelessWidget {
  final double imageSize;
  final double? imageSeparation;
  const HomePageImageSide({
    super.key,
    required this.imageSize,
    this.imageSeparation,
  });

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/small-view.jpg',
          fit: BoxFit.cover,
          height: imageSize,
        ),
        SizedBox(width: imageSeparation ?? 32),
        Image.asset(
          'assets/images/split-view.jpg',
          fit: BoxFit.cover,
          height: imageSize,
        ),
      ],
    );
  }
}
