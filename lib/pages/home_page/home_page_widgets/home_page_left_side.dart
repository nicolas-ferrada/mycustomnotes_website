import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageLeftSide extends StatelessWidget {
  const HomePageLeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleText(),
        const SizedBox(height: 32),
        bodyText(),
        const SizedBox(height: 32),
        storeButtons(),
        const SizedBox(height: 128),
      ],
    );
  }

  Widget titleText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Organize your day',
          style:
              TextStyle(fontSize: 72, fontWeight: FontWeight.bold, height: 0),
        ),
        Text(
          'and save your favorite moments in one place!',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget bodyText() {
    return const Column(
      children: [
        Text(
          'Simplify your day by effortlessly managing your to-dos,',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'capturing valuable thoughts, ideas, and cherished moments.',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Organize your digital life with ease.',
          style: TextStyle(
            fontSize: 18,
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
