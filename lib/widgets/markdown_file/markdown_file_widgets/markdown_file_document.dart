import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'markdown_file_style.dart';

class MarkdownFileDocument extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final double horizontalPadding;
  const MarkdownFileDocument({
    super.key,
    required this.snapshot,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: snapshot.data!,
      styleSheet: MarkdownFileStyle.markdownStyle(),
      selectable: true,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 64),
      onTapLink: (text, url, title) {
        if (url != null) {
          launchUrl(Uri.parse(url));
        }
      },
    );
  }
}
