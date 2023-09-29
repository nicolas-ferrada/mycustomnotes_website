import 'package:flutter/material.dart';
import 'package:mycustomnotes_website/widgets/markdown_files.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarkdownFiles(
      fileLocationName: "assets/legal/terms-of-service.md",
    );
  }
}
