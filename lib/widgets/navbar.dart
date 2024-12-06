import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color getTabColor(int index) {
      return currentIndex == index ? Colors.blue : Colors.grey;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'My Portfolio',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => onTabSelected(0),
              child: Text(
                'Home',
                style: TextStyle(
                  color: getTabColor(0),
                  fontWeight: currentIndex == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () => onTabSelected(1),
              child: Text(
                'About',
                style: TextStyle(
                  color: getTabColor(1),
                  fontWeight: currentIndex == 1 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () => onTabSelected(2),
              child: Text(
                'Projects',
                style: TextStyle(
                  color: getTabColor(2),
                  fontWeight: currentIndex == 2 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () => onTabSelected(3),
              child: Text(
                'Contact',
                style: TextStyle(
                  color: getTabColor(3),
                  fontWeight: currentIndex == 3 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
