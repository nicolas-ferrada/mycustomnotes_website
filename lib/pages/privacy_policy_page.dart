import 'package:flutter/material.dart';
import 'package:mycustomnotes_website/widgets/markdown_file/markdown_file.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarkdownFile(
      fileLocationName: "assets/legal/privacy-policy.md",
    );
  }
}
