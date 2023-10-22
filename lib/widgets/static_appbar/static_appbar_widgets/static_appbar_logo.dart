import 'package:flutter/material.dart';

class StaticAppbarLogo extends StatelessWidget {
  final double logoSize;
  final double logoLeftPadding;
  const StaticAppbarLogo({
    super.key,
    required this.logoSize,
    required this.logoLeftPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(logoLeftPadding, 8, 0, 8),
      child: Image.asset(
        'assets/images/logo-letters.png',
        width: logoSize,
      ),
    );
  }
}
