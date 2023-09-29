import 'package:flutter/material.dart';
import 'package:mycustomnotes_website/widgets/markdown_files.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarkdownFiles(
      fileLocationName: "assets/legal/privacy-policy.md",
    );
  }
}
