import 'package:flutter/material.dart';

class TabletHome extends StatelessWidget {
  const TabletHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello! I am [Your Name]',
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            Text('A Flutter Developer',
                style: Theme.of(context).textTheme.subtitle1),
            // Add other sections here
          ],
        ),
      ),
    );
  }
}
