import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/routes.dart';
import 'static_appbar_item.dart';

class StaticAppbarActions {
  static List<Widget> actions({
    required BuildContext context,
  }) {
    return [
      StaticAppbarItem(
        text: 'Home',
        function: () => context.go(homePageRoute),
      ),
      StaticAppbarItem(
        text: 'Terms of service',
        function: () => context.go(termsOfServiceRoute),
      ),
      StaticAppbarItem(
        text: 'Privacy policy',
        function: () => context.go(privacyPolicyRoute),
      ),
      StaticAppbarItem(
        text: 'Account delete',
        function: () => context.go(accountDeleteRoute),
      ),
      StaticAppbarItem(
        text: 'Contact',
        function: () => context.go(contactRoute),
      ),
      StaticAppbarItem(
        text: 'Developer',
        function: () async =>
            await launchUrl(Uri.parse('https://nicolasferrada.com')),
      ),
      const SizedBox(
        width: 32,
      ),
    ];
  }
}
