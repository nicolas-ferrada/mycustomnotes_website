import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownFileStyle {
  static MarkdownStyleSheet markdownStyle() {
    return MarkdownStyleSheet(
      // All text
      p: const TextStyle(fontSize: 18),

      // All text spacing
      blockSpacing: 16,

      // H1: first title
      h1: const TextStyle(fontSize: 50),
      h1Padding: const EdgeInsets.only(bottom: 32),
      h1Align: WrapAlignment.center,

      // H2: block title
      h2: const TextStyle(fontSize: 38),
      h2Padding: const EdgeInsets.only(top: 64),

      // H3: block subtitle
      h3: const TextStyle(fontSize: 28),
      h3Padding: const EdgeInsets.only(top: 12),
    );
  }
}
