import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../../widgets/navbar.dart';
import '../../widgets/resume_viewr.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'footer.dart';
import 'home_page.dart';
import 'projects_page.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  final PageController _pageController = PageController();
  final ThemeController themeController = Get.put(ThemeController());
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Navbar(
          currentIndex: _pageIndex,
          onTabSelected: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
//

      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              AboutPage(),
              ProjectsPage(),
              ContactPage(),
            ],
          ),
          // Social Media Stack
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            right: 0,
            child: _buildSocialMediaIcons(),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
      //flowting buttion custom ui chnge theme  
// class ThemeController extends GetxController {
//   var isDarkMode = false.obs;

//   void toggleTheme() {
//     isDarkMode.value = !isDarkMode.value;
//     Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
//   }
// }
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeController.toggleTheme();
        },
        child: const Icon(Icons.lightbulb),
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.facebook, color: Colors.blue),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.email, color: Colors.red),
          onPressed: () {
            // Add Instagram link
          },
        ),
        IconButton(
          icon: const Icon(Icons.link, color: Colors.blueGrey),
          onPressed: () {
            // Add LinkedIn link
          },
        ),
        IconButton(
          icon: const Icon(Icons.code, color: Colors.black),
          onPressed: () {
            // Add GitHub link
          },
        ),
      ],
    );
  }
}
