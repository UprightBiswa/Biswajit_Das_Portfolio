import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/resume_viewr.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.blue.shade50,
    //   child: Center(
    //     child: Text(
    //       'Welcome to My Portfolio!',
    //       style: Theme.of(context).textTheme.headline4,
    //     ),
    //   ),
    // );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          Container(
            height: 600,
            width: double.infinity,
            color: Colors.blue.shade50, // Background color for hero section
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Introduction Text
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi, I\'m Biswajit Das',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'I am a Flutter Developer specializing in creating beautiful and responsive mobile applications.',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add action for downloading resume
                              Get.to(ResumeScreen());
                            },
                            child: const Text('Download Resume'),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              // Add action for contacting
                            },
                            child: const Text('Contact Me'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                // Profile Image or Illustration
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
