import 'package:flutter/material.dart';

import '../widgets/markdown_file/markdown_file.dart';

class AccountDelete extends StatelessWidget {
  const AccountDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarkdownFile(
      fileLocationName: "assets/account_delete/account-delete.md",
    );
  }
}
