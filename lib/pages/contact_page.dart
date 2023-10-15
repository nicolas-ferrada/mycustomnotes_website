import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titlePage(),
        bodyPage(),
      ],
    );
  }

  Widget bodyPage() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Contact information',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Owner and data controller',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Name: Nicolás Ferrada',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SelectableText(
          'Email: mycustomnotes@nicolasferrada.com',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'If you have any questions, you can contact us by email.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget titlePage() {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Contact us',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
