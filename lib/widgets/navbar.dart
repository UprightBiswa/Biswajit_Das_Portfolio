import 'package:flutter/material.dart';

import '../utils/responseve_layout.dart';

class ResponsiveAppBar extends StatelessWidget {
  final Function(int) onTabSelected;
  final int currentIndex;

  const ResponsiveAppBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: ResponsiveLayout(
          mobile: _buildMobileAppBar(context),
          tablet: _buildDesktopAppBar(),
          desktop: _buildDesktopAppBar(),
        ),
      ),
    );
  }

  /// Mobile AppBar with Drawer
  Widget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      elevation: 0,
      title: const Text(
        'Biswajit Das',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return _buildIconContainer(
              icon: Icons.menu, onTap: () => _showDrawer(context));
        },
      ),
      actions: [
        Row(
          children: [
            _buildIconContainer(icon: Icons.code, onTap: () {}),
            _buildIconContainer(icon: Icons.link, onTap: () {}),
          ],
        ),
      ],
    );
  }

  /// Show Drawer
  void _showDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  /// Desktop and Tablet AppBar with TabBar
  Widget _buildDesktopAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Name
          const Text(
            'Biswajit Das',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          // TabBar with Custom Styling
          // Expanded(
          //   child: TabBar(
          //     onTap: (index) {
          //       onTabSelected(index);
          //     },
          //     //zero
          //     labelPadding: EdgeInsets.zero,
          //     indicatorColor: Colors.black,
          //     labelColor: Colors.black,
          //     unselectedLabelColor: Colors.grey[400],
          //     labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          //     tabs: const [
          //       Tab(text: 'Home'),
          //       Tab(text: 'About'),
          //       Tab(text: 'Projects'),
          //       Tab(text: 'Contact Me'),
          //     ],
          //   ),
          // ),
          Row(
            children: [
              _buildTabButton(0, 'Home'),
              _buildTabButton(1, 'About'),
              _buildTabButton(2, 'Projects'),
              _buildTabButton(3, 'Contact Me'),
            ],
          ),
          // Social Icons
          Row(
            children: [
              _buildIconContainer(icon: Icons.code, onTap: () {}),
              _buildIconContainer(icon: Icons.link, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String title) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: currentIndex == index ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: currentIndex == index ? Colors.black : Colors.grey,
            fontWeight:
                currentIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  /// Common Icon Container Widget
  Widget _buildIconContainer(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.black, size: 20),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;
  const AppDrawer(
      {super.key, required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Navigation',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildDrawerTab(context, 'Home', 0),
            _buildDrawerTab(context, 'About', 1),
            _buildDrawerTab(context, 'Projects', 2),
            _buildDrawerTab(context, 'Contact Me', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTab(BuildContext context, String title, int index) {
    final bool isSelected = currentIndex == index;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor: isSelected ? Colors.blue.withOpacity(0.1) : null,
      onTap: () {
        Navigator.pop(context); // Close the drawer
        onTabSelected(index); // Notify parent of the selected index
      },
    );
  }
}
