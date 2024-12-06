import 'package:flutter/material.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello! I am [Your Name]', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            Text('A Flutter Developer', style: Theme.of(context).textTheme.titleLarge),
            // Add other sections here
          ],
        ),
      ),
    );
  }
}
