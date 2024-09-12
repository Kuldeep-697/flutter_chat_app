import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_chat/join_call_page.dart';
import 'package:video_chat/screens/login.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: primaryColor,
        shadowColor: secondaryColor,
      ),
      home: const Login(),
    );
  }
}
