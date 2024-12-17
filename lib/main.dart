import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash/splash_view.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: const SplashView(),
    );
  }
}
