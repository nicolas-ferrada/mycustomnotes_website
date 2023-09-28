import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mycustomnotes_website/routes/routes.dart';

class RouteErrorPage extends StatelessWidget {
  const RouteErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'There is a problem, the page may not exist.',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(170, 60),
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                context.go(homePageRoute);
              },
              child: const Text(
                'Home page',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
