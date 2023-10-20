import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/routes.dart';
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 160,
        titleSpacing: 180,
        title: Image.asset(
          'assets/images/logo-letters.png',
          fit: BoxFit.contain,
        ),
        actions: appBarActions(context),
      ),
      body: child,
    );
  }

  List<Widget>? appBarActions(BuildContext context) {
    return [
      AppBarItem(
        text: 'Home',
        function: () => context.go(homePageRoute),
      ),
      AppBarItem(
        text: 'Terms of service',
        function: () => context.go(termsOfServiceRoute),
      ),
      AppBarItem(
        text: 'Privacy policy',
        function: () => context.go(privacyPolicyRoute),
      ),
      AppBarItem(
        text: 'Account delete',
        function: () => context.go(accountDeleteRoute),
      ),
      AppBarItem(
        text: 'Contact',
        function: () => context.go(contactRoute),
      ),
      AppBarItem(
        text: 'Developer',
        function: () async =>
            await launchUrl(Uri.parse('https://nicolasferrada.com')),
      ),
      const SizedBox(
        width: 64,
      ),
    ];
  }
}

class AppBarItem extends StatelessWidget {
  final String text;
  final Function() function;
  const AppBarItem({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: function,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
