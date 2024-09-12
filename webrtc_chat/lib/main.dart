import 'package:flutter/material.dart';
import 'package:webrtc_chat/businessLayer/queries.dart';
import 'package:webrtc_chat/businessLayer/query_document_provider.dart';
import 'package:get/get.dart';
import 'package:webrtc_chat/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final queries = NovamaxAPIs();
  @override
  Widget build(BuildContext context) {
    return QueriesDocumentProvider(
      queries: queries,
      child: const GetMaterialApp(
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
