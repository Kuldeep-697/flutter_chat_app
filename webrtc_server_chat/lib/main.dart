// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webrtc_server_chat/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
