import 'package:flutter/material.dart';

import '../widgets/markdown_files.dart';

class AccountDelete extends StatelessWidget {
  const AccountDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarkdownFiles(
      fileLocationName: "assets/account_delete/account-delete.md",
    );
  }
}
