import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString("assets/privacy-policy.md"),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
            styleSheet: markdownStyle(),
            selectable: true,
            padding: const EdgeInsets.symmetric(horizontal: 500, vertical: 64),
            onTapLink: (text, url, title) {
              if (url != null) {
                launchUrl(Uri.parse(url));
              }
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  MarkdownStyleSheet markdownStyle() {
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
