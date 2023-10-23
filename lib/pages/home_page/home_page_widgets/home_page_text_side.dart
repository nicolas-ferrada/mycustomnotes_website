import 'package:flutter/material.dart';

import 'home_page_buttons.dart';

class HomePageTextSide extends StatelessWidget {
  final double titleFontSize;
  final double subtitleFontSize;
  final double bodyFontSize;
  final bool? isMobile;
  const HomePageTextSide({
    super.key,
    required this.bodyFontSize,
    required this.subtitleFontSize,
    required this.titleFontSize,
    this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText(),
          const SizedBox(height: 32),
          bodyText(),
          const SizedBox(height: 32),
          storeButtons(context: context),
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
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w900,
            height: 0,
          ),
        ),
        Text(
          'and save your favorite moments in one place!',
          textAlign: TextAlign.center,
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
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: bodyFontSize,
          ),
        ),
        Text(
          'capturing valuable thoughts, ideas, and cherished moments.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: bodyFontSize,
          ),
        ),
        Text(
          'Organize your digital life with ease.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: bodyFontSize,
          ),
        ),
      ],
    );
  }

  Widget storeButtons({
    required BuildContext context,
  }) {
    return (isMobile != null && isMobile == true)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: HomePageStoreButtons.buttons(
              context: context,
              isMobile: isMobile,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: HomePageStoreButtons.buttons(
              context: context,
              isMobile: isMobile,
            ),
          );
  }
}
