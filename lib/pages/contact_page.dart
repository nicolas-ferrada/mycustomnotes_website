import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 220,
        width: 500,
        child: Card(
          color: const Color(0xFF322D40),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                title(),
                const SizedBox(height: 32),
                body(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return const Center(
      child: Text(
        'Owner and data controller',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget body() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'Name: Nicolás Ferrada',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SelectableText(
          'Email: mycustomnotes@nicolasferrada.com',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 32),
        Text(
          'If you have any questions, you can contact us by email.',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
