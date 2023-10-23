import 'package:flutter/material.dart';

class StaticAppbarItem extends StatelessWidget {
  final String text;
  final Function() function;
  const StaticAppbarItem({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: function,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
