import 'package:go_router/go_router.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/privacy_policy_page/privacy_policy_page.dart';
import '../pages/terms_of_service_page.dart';
import 'route_error_page.dart';
import '../widgets/static_navigation_app_bar_widget.dart';

const String homePageRoute = '/';
const String privacyPolicyRoute = '/privacy-policy';
const String termsOfServiceRoute = '/terms-of-service';
const String contactRoute = '/contact';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    initialLocation: homePageRoute,
    errorBuilder: (context, state) => const RouteErrorPage(),
    routes: [
      ShellRoute(
        builder: (context, _, child) =>
            StaticNavigationAppBarWidget(child: child),
        routes: [
          GoRoute(
            path: homePageRoute,
            pageBuilder: (context, _) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: privacyPolicyRoute,
            pageBuilder: (context, _) => const NoTransitionPage(
              child: PrivacyPolicyPage(),
            ),
          ),
          GoRoute(
            path: termsOfServiceRoute,
            pageBuilder: (context, _) => const NoTransitionPage(
              child: TermsOfServicePage(),
            ),
          ),
          GoRoute(
            path: contactRoute,
            pageBuilder: (context, _) => const NoTransitionPage(
              child: ContactPage(),
            ),
          ),
        ],
      )
    ],
  );
}
