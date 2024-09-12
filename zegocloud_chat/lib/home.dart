import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloud_chat/call_invitation.dart';
import 'package:zegocloud_chat/constants.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController callId = TextEditingController();

  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: callId,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'ID',
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: userName,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'username',
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ZegoUIKitPrebuiltCallInvitationService().init(
                  appID: Constants.appId,
                  appSign: Constants.appSign,
                  userID: callId.text.trim(),
                  userName: userName.text.trim(),
                  plugins: [ZegoUIKitSignalingPlugin()],
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CallInvitation())
                );
              },
              child: const Text('Invite'))
        ],
      ),
    );
  }
}
