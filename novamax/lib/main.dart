import 'package:flutter/material.dart';
import 'package:novamax/introduction_page.dart';

void main() {
  runApp(const NovaMaxApp());
}

class NovaMaxApp extends StatelessWidget {
  const NovaMaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroductionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
