import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycustomnotes_website/widgets/markdown_file/markdown_file_widgets/markdown_file_document.dart';

class MarkdownFile extends StatelessWidget {
  final String fileLocationName;
  const MarkdownFile({
    super.key,
    required this.fileLocationName,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString(fileLocationName),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 700) {
                return mobileMarkdownFile(snapshot: snapshot);
              } else if (constraints.maxWidth < 1500) {
                return tabletMarkdownFile(snapshot: snapshot);
              } else {
                return desktopMarkdownFile(snapshot: snapshot);
              }
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('An error ocurred with the file: ${snapshot.error}'),
          );
        }
      },
    );
  }

  Widget mobileMarkdownFile({
    required AsyncSnapshot snapshot,
  }) {
    return MarkdownFileDocument(
      snapshot: snapshot,
      horizontalPadding: 20,
    );
  }

  Widget tabletMarkdownFile({
    required AsyncSnapshot snapshot,
  }) {
    return MarkdownFileDocument(
      snapshot: snapshot,
      horizontalPadding: 150,
    );
  }

  Widget desktopMarkdownFile({
    required AsyncSnapshot snapshot,
  }) {
    return MarkdownFileDocument(
      snapshot: snapshot,
      horizontalPadding: 400,
    );
  }
}
