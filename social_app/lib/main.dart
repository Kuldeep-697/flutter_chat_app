import 'package:flutter/material.dart';
import 'package:social_app/config/app_routes.dart';
import 'package:social_app/screens/main_page.dart';
import 'package:social_app/styles/app_colors.dart';

void main() {
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes
    );
  }
}
