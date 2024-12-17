// import 'package:flutter/material.dart';

// class AboutPage extends StatelessWidget {
//   const AboutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return Container(
//     //   color: Colors.green.shade50,
//     //   child: Center(
//     //     child: Text(
//     //       'About Me: Flutter Developer',
//     //       style: Theme.of(context).textTheme.headline4,
//     //     ),
//     //   ),
//     // );
//   }
// }
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            const Text(
              'About Me',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildLeftSection(),
                ),
                Container(
                  width: 3,
                  color: Colors.blue,
                  height: 600,
                ),
                Expanded(
                  child: _buildRightSection(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildSkillBar('Flutter', 0.85),
            _buildSkillBar('Firebase', 0.8),
            _buildSkillBar('Angular', 0.7),
            _buildSkillBar('Django REST API', 0.75),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildTimelineCard(
          title: 'Bachelor of Technology (CSE)',
          date: '2018 - 2022',
          description: 'Graduated with honors from XYZ University.',
        ),
        _buildTimelineCard(
          title: 'Intermediate (Science)',
          date: '2016 - 2018',
          description: 'Achieved 90% in Science stream, ABC College.',
        ),
        _buildTimelineCard(
          title: 'Certifications',
          date: 'Ongoing',
          description: 'Completed Flutter Development, Firebase, and Angular.',
        ),
      ],
    );
  }

  Widget _buildRightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimelineCard(
          title: 'Associate Android Developer',
          date: '2023 - Present',
          description:
              'Indigi Consulting and Solutions Pvt. Ltd. Working on Flutter projects and backend integrations.',
        ),
        _buildTimelineCard(
          title: 'Flutter Developer Intern',
          date: '2024',
          description:
              'Meta Scifor Technologies Pvt. Ltd. Developed Restaurant Pager mobile app using Flutter, Firebase, and GetX.',
        ),
      ],
    );
  }

  Widget _buildTimelineCard({
    required String title,
    required String date,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillBar(String skill, double proficiency) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Stack(
            children: [
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 8,
                width: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                        .size
                        .width *
                    proficiency,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
