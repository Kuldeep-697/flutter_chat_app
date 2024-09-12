import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallInvitation extends StatefulWidget {
  const CallInvitation({super.key});

  @override
  State<CallInvitation> createState() => _CallInvitationState();
}

class _CallInvitationState extends State<CallInvitation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZegoSendCallInvitationButton(
           isVideoCall: true,
           resourceID: "zegouikit_call",
           invitees: [
              ZegoUIKitUser(
                id: '2',
                name: 'pro',
              ),
           ],
        ),
      ),
    );
  }
}