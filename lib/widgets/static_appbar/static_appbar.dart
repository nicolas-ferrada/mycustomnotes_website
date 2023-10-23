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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: child,
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => scaffoldKey.currentState?.closeDrawer(),
              child: StaticAppbarActions.actions(context: context)[index],
            );
          },
          itemExtent: 100,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 50,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 90,
        title: const Center(
          child: StaticAppbarLogo(
            logoSize: 180,
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: child,
      drawer: Drawer(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => scaffoldKey.currentState?.closeDrawer(),
              child: StaticAppbarActions.actions(context: context)[index],
            );
          },
          itemExtent: 120,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
        ),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Transform.scale(
            scale: 1.5,
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 40,
              ),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 140,
        title: const Center(
          child: StaticAppbarLogo(
            logoSize: 300,
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
