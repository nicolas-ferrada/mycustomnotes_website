import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mycustomnotes_website/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticNavigationAppBarWidget extends StatelessWidget {
  final Widget child;

  const StaticNavigationAppBarWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Custom Notes'),
        actions: appBarActions(context),
      ),
      body: child,
    );
  }

  List<Widget>? appBarActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            context.go(homePageRoute);
          },
          child: const Text('Home'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            context.go(termsOfServiceRoute);
          },
          child: const Text('Terms of Service'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            context.go(privacyPolicyRoute);
          },
          child: const Text('Privacy Policy'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            context.go(contactRoute);
          },
          child: const Text('Contact'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            launchUrl(Uri.parse('https://nicolasferrada.com'));
          },
          child: const Text('Developer'),
        ),
      ),
      const SizedBox(
        width: 64,
      )
    ];
  }
}
