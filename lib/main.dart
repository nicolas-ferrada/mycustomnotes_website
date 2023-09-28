import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(MyApp(
    router: AppRoutes.routes,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Custom Notes',
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          background: Colors.grey.shade900,
          primary: Colors.white60,
        ),
      ),
    );
  }
}
