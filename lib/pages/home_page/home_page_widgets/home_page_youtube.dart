import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageYoutube extends StatelessWidget {
  const HomePageYoutube({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () async => await launchUrl(
          Uri.parse('https://youtu.be/DOAFupAHOC4'),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/youtube-logo.png',
              width: 80,
            ),
            const SizedBox(height: 8),
            const Text("Watch the app's trailer!"),
          ],
        ),
      ),
    );
  }
}
