import 'package:dummy_project/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project/pages/home_screen.dart';
import 'package:dummy_project/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.loginRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomeScreen(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
