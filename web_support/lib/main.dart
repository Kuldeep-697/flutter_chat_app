import 'package:flutter/material.dart';
import 'package:web_support/config/palette.dart';
import 'package:web_support/screens/screen_tabs.dart';

void main() {
  runApp(const FacebookApp());
}

class FacebookApp extends StatelessWidget {
  const FacebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity, 
        scaffoldBackgroundColor: Palette.scaffold 
      ),
      home: const TabsScreen(),
    );
  }
}
