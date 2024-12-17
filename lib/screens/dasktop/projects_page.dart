import 'package:flutter/material.dart';

import '../../utils/responseve_layout.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Restaurant Pager',
        'description': 'A mobile app for restaurant management.',
        'image': 'assets/images/krepl.jpg',
        'link': 'https://github.com/yourproject',
      },
      {
        'title': 'Portfolio Website',
        'description': 'A personal portfolio built with Flutter.',
        'image': 'assets/images/fa.png',
        'link': 'https://github.com/yourproject',
      },
      {
        'title': 'Cultivo',
        'description': 'A modern portfolio built with Flutter.',
        'image': 'assets/images/cultivo.png',
        'link': 'https://github.com/yourproject',
      },
      // Add more projects as needed
    ];

    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ResponsiveLayout(
            mobile: _buildProjectsGrid(projects, 1),
            tablet: _buildProjectsGrid(projects, 2),
            desktop: _buildProjectsGrid(projects, 3),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(
      List<Map<String, String>> projects, int crossAxisCount) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    project['image']!,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project['description']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('View Details'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('GitHub'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
