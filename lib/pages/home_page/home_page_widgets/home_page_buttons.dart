import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageStoreButtons {
  static List<Widget> buttons({
    required BuildContext context,
    required bool? isMobile,
  }) {
    return [
      Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: InkWell(
          borderRadius: BorderRadius.zero,
          onTap: () async => await launchUrl(
            Uri.parse(
                'https://apps.apple.com/us/app/my-custom-notes/id6469385680?platform=iphone'),
          ),
          child: Image.asset(
            'assets/images/app-store-badge.png',
            width: (isMobile != null && isMobile == true) ? 195 : 180,
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
          onTap: () async => await launchUrl(
            Uri.parse(
                'https://play.google.com/store/apps/details?id=com.nicolasferrada.mycustomnotes'),
          ),
          child: Image.asset(
            'assets/images/google-play-badge.png',
            width: 230,
          ),
        ),
      ),
    ];
  }
}
