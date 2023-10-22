import 'package:flutter/material.dart';

import 'static_appbar_widgets/static_appbar_actions.dart';
import 'static_appbar_widgets/static_appbar_logo.dart';

class StaticAppbar extends StatelessWidget {
  final Widget child;

  const StaticAppbar({
    super.key,
    required this.child,
  });

  // Each view must return a Scaffold
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 700) {
          return mobileAppBar(
            child: child,
            context: context,
          );
        } else if (constraints.maxWidth < 1500) {
          return tabletAppBar(
            child: child,
            context: context,
          );
        } else if (constraints.maxWidth < 1700) {
          return smallDesktopAppBar(
            child: child,
            context: context,
          );
        } else {
          return desktopAppBar(
            child: child,
            context: context,
          );
        }
      },
    );
  }

  static Widget mobileAppBar({
    required Widget child,
    required BuildContext context,
  }) {
    return Scaffold(
      body: child,
      drawer: Drawer(
        child: ListView(
          itemExtent: 80,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: StaticAppbarActions.actions(context: context),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 50,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 160,
        title: const Center(
          child: StaticAppbarLogo(
            logoSize: 260,
            logoLeftPadding: 0,
          ),
        ),
      ),
    );
  }

  static Widget tabletAppBar({
    required Widget child,
    required BuildContext context,
  }) {
    return Scaffold(
      body: child,
      drawer: Drawer(
        child: ListView(
          itemExtent: 120,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: StaticAppbarActions.actions(context: context),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 80,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 160,
        title: const Center(
          child: StaticAppbarLogo(
            logoSize: 320,
            logoLeftPadding: 0,
          ),
        ),
      ),
    );
  }

  static Widget smallDesktopAppBar({
    required Widget child,
    required BuildContext context,
  }) {
    return Scaffold(
      body: child,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 160,
        title: const StaticAppbarLogo(
          logoSize: 275,
          logoLeftPadding: 22,
        ),
        actions: StaticAppbarActions.actions(context: context),
      ),
    );
  }

  static Widget desktopAppBar({
    required Widget child,
    required BuildContext context,
  }) {
    return Scaffold(
      body: child,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 160,
        title: const StaticAppbarLogo(
          logoSize: 300,
          logoLeftPadding: 200,
        ),
        actions: StaticAppbarActions.actions(context: context),
      ),
    );
  }
}
