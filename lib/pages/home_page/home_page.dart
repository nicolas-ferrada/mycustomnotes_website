import 'package:flutter/material.dart';

import 'home_page_widgets/home_page_text_side.dart';
import 'home_page_widgets/home_page_image_side.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 700) {
          return mobileHomePage();
        } else if (constraints.maxWidth < 1500) {
          return tabletHomePage();
        } else {
          return desktopHomePage();
        }
      },
    );
  }

  Widget mobileHomePage() {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomePageTextSide(
            titleFontSize: 28,
            subtitleFontSize: 15,
            bodyFontSize: 14,
            isMobile: true,
          ),
          HomePageImageSide(
            imageSize: 300,
            imageSeparation: 12,
          ),
        ],
      ),
    );
  }

  Widget tabletHomePage() {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomePageTextSide(
            titleFontSize: 78,
            subtitleFontSize: 28,
            bodyFontSize: 18,
          ),
          HomePageImageSide(imageSize: 650),
        ],
      ),
    );
  }

  Widget desktopHomePage() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HomePageTextSide(
          titleFontSize: 88,
          subtitleFontSize: 32,
          bodyFontSize: 18,
        ),
        HomePageImageSide(imageSize: 600),
      ],
    );
  }
}
