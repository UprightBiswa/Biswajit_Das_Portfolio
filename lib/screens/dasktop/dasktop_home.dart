// // ignore_for_file: invalid_use_of_protected_member

// import 'package:flutter/material.dart';
// import '../../widgets/navbar.dart';
// import 'about_page.dart';
// import 'contact_page.dart';
// import 'footer.dart';
// import 'home_page.dart';
// import 'projects_page.dart';

// class DesktopHome extends StatefulWidget {
//   const DesktopHome({super.key});

//   @override
//   State<DesktopHome> createState() => _DesktopHomeState();
// }

// class _DesktopHomeState extends State<DesktopHome> {
//   late ScrollController scrollController;
//   final List<GlobalKey> _sectionKeys = [
//     GlobalKey(),
//     GlobalKey(),
//     GlobalKey(),
//     GlobalKey(),
//   ];
//   int _currentIndex = 0;
//   final ValueNotifier<bool> _isBottomNavVisible = ValueNotifier<bool>(true);
//   double _lastScrollOffset = 0.0;
//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(animateToTab);
//     scrollController.addListener(_handleScroll);
//   }

//   void _handleScroll() {
//     // Hide/show bottom navigation bar based on scroll direction
//     final currentOffset = scrollController.offset;
//     if (currentOffset > _lastScrollOffset) {
//       // Scrolling down
//       _isBottomNavVisible.value = false;
//     } else {
//       // Scrolling up
//       _isBottomNavVisible.value = true;
//     }
//     _lastScrollOffset = currentOffset;
//   }

//   void animateToTab() {
//     late RenderBox box;
//     for (int i = 0; i < _sectionKeys.length; i++) {
//       box = _sectionKeys[i].currentContext!.findRenderObject() as RenderBox;
//       Offset position = box.localToGlobal(Offset.zero);

//       if (scrollController.offset >= position.dy) {
//         setState(() {
//           _currentIndex = i;
//         });
//       }
//     }
//   }

//   void scrollToIndex(int index) async {
//     // Avoid adding multiple listeners
//     if (!scrollController.hasListeners) {
//       scrollController.addListener(animateToTab);
//     }
//     final targetContext = _sectionKeys[index].currentContext;
//     if (targetContext != null) {
//       scrollController.removeListener(() => animateToTab());
//       await Scrollable.ensureVisible(
//         targetContext,
//         duration: const Duration(milliseconds: 600),
//         curve: Curves.easeInOut,
//       );
//       setState(() {
//         _currentIndex = index;
//       });
//       scrollController.addListener(animateToTab);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: AppDrawer(
//         currentIndex: _currentIndex,
//         onTabSelected: (index) {
//           scrollToIndex(index);
//         },
//       ),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: ResponsiveAppBar(
//           currentIndex: _currentIndex,
//           onTabSelected: (index) {
//             scrollToIndex(index);
//           },
//         ),
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (notification) {
//           if (notification is ScrollUpdateNotification) {
//             _handleScroll();
//           }
//           return false;
//         },
//         child: SingleChildScrollView(
//           controller: scrollController,
//           child: Column(
//             children: [
//               _buildSection(_sectionKeys[0], const HomePage()),
//               _buildSection(_sectionKeys[1], const AboutPage()),
//               _buildSection(_sectionKeys[2], const ProjectsPage()),
//               _buildSection(_sectionKeys[3], const ContactPage()),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: ValueListenableBuilder<bool>(
//         valueListenable: _isBottomNavVisible,
//         builder: (context, isVisible, child) {
//           return AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             height: isVisible ? kBottomNavigationBarHeight + 100 : 0.0,
//             child: child,
//           );
//         },
//         child: const Footer(),
//       ),
//     );
//   }

//   Widget _buildSection(GlobalKey key, Widget child) {
//     return Container(
//       key: key,
//       child: child,
//     );
//   }
// }

// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  final ValueNotifier<bool> _isBottomNavVisible = ValueNotifier<bool>(true);
  int _currentIndex = 0;
  double _lastScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    // Toggle bottom navigation visibility based on scroll direction
    final currentOffset = _scrollController.offset;
    if (currentOffset > _lastScrollOffset) {
      // Scrolling down
      _isBottomNavVisible.value = false;
    } else {
      // Scrolling up
      _isBottomNavVisible.value = true;
    }
    _lastScrollOffset = currentOffset;

    // Update the active tab based on scroll position
    _updateActiveTab();
  }

  void _updateActiveTab() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero, ancestor: null).dy;
          if (_scrollController.offset >= position - 100) {
            setState(() {
              _currentIndex = i;
            });
          }
        }
      }
    }
  }

  void _scrollToIndex(int index) async {
    final targetContext = _sectionKeys[index].currentContext;
    if (targetContext != null) {
      await Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          _scrollToIndex(index);
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ResponsiveAppBar(
          currentIndex: _currentIndex,
          onTabSelected: (index) {
            _scrollToIndex(index);
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildSection(_sectionKeys[0], const HomePage()),
            _buildSection(_sectionKeys[1], const AboutPage()),
            _buildSection(_sectionKeys[2], const ProjectsPage()),
            _buildSection(_sectionKeys[3], const ContactPage()),
            const Footer(),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: _isBottomNavVisible,
        builder: (context, isVisible, child) {
          return AnimatedContainer(
            color: Colors.transparent,
            duration: const Duration(milliseconds: 300),
            height: isVisible ? 80 : 0.0,
            child: Visibility(
              visible: isVisible,
              child: child!,
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Add action for downloading resume
              Get.to(ResumeScreen());
            },
            child: const Text(
              'Download Resume',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(GlobalKey key, Widget child) {
    return Container(
      key: key,
      child: child,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
