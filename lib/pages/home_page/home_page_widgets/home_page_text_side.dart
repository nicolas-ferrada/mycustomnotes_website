import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageTextSide extends StatelessWidget {
  final double titleFontSize;
  final double subtitleFontSize;
  final double bodyFontSize;
  const HomePageTextSide({
    super.key,
    required this.bodyFontSize,
    required this.subtitleFontSize,
    required this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText(),
          const SizedBox(height: 32),
          bodyText(),
          const SizedBox(height: 32),
          storeButtons(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget titleText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Organize your day',
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w900,
            height: 0,
          ),
        ),
        Text(
          'and save your favorite moments in one place!',
          style: TextStyle(
              fontSize: subtitleFontSize, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget bodyText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Simplify your day by effortlessly managing your to-dos,',
          style: TextStyle(
            fontSize: bodyFontSize,
          ),
        ),
        Text(
          'capturing valuable thoughts, ideas, and cherished moments.',
          style: TextStyle(
            fontSize: bodyFontSize,
          ),
        ),
        Text(
          'Organize your digital life with ease.',
          style: TextStyle(
            fontSize: bodyFontSize,
          ),
        ),
      ],
    );
  }

  Widget storeButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: InkWell(
                borderRadius: BorderRadius.zero,
                onTap: () async => await launchUrl(Uri.parse('')),
                child: Image.asset(
                  'assets/images/app-store-badge.png',
                  width: 180,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: InkWell(
                splashColor: null,
                onTap: () async => await launchUrl(Uri.parse('')),
                child: Image.asset(
                  'assets/images/google-play-badge.png',
                  width: 230,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
