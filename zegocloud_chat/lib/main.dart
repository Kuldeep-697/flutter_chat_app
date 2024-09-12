import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloud_chat/home.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(MyApp(navigatorKey: navigatorKey));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

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
      home: const Home(),
    );
  }
}
