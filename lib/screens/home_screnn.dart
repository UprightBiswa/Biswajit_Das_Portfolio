import 'package:flutter/material.dart';

import '../utils/responseve_layout.dart';
import 'dasktop/dasktop_home.dart';
import 'mobile/mobile_home.dart';
import 'tablet/tablat_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: DesktopHome(),
      tablet: DesktopHome(),
      desktop: DesktopHome(),
    );
  }
}
