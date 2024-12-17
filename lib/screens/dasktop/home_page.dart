import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/responseve_layout.dart';
import '../../widgets/resume_viewr.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: HeroSectionMobile(),
      tablet: HeroSectionTablet(),
      desktop: HeroSectionDesktop(),
    );
  }
}

// Hero Section for Mobile
class HeroSectionMobile extends StatelessWidget {
  const HeroSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.shade50,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Introduction Text
            Text(
              'Hi, I\'m Biswajit Das',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Flutter Developer specializing in creating beautiful and responsive mobile applications. I thrive on building intuitive apps, learning new technologies like GoLang, and integrating backend systems.',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(const ResumeScreen());
                  },
                  child: const Text('Download Resume'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Add contact action
                  },
                  child: const Text('Contact Me'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Hero Section for Tablet
class HeroSectionTablet extends StatelessWidget {
  const HeroSectionTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1),
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
            const SizedBox(width: 40),
            // Introduction Text
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, I\'m Biswajit Das',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Flutter Developer specializing in creating beautiful and responsive mobile applications. With 1.7 years of experience in mobile app development using Flutter and Laravel backend, I focus on performance, user experience, and quality apps.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(const ResumeScreen());
                        },
                        child: const Text('Download Resume'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Add contact action
                        },
                        child: const Text('Contact Me'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Hero Section for Desktop
class HeroSectionDesktop extends StatelessWidget {
  const HeroSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        padding: const EdgeInsets.all(30),
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
                    'Android Developer specializing in Flutter. I thrive on building intuitive apps, learning new technologies like GoLang, and integrating backend systems. Proficient in Flutter, Firebase, Laravel, and GetX, I deliver quality apps with an eye for performance and user experience.',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 20,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(const ResumeScreen());
                        },
                        child: const Text('Download Resume'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Add contact action
                        },
                        child: const Text('Contact Me'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 50),
            // Profile Image
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1),
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
    );
  }
}
