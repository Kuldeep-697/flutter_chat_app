import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:webrtc_chat/call_screen.dart';

var client;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key, 
    required this.token, 
    required this.id, 
    required this.name,
  });

  final String id;
  final String name;
  final String token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Use the token to get the userId
    String userId = widget.id;

    client = StreamVideo(
      'yf8h5fznwtvf',
      user: User.regular(
        userId: userId,
        role: 'admin',
        name: widget.name,
      ),
      userToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiUHJpbmNlX1hpem9yIiwiaXNzIjoiaHR0cHM6Ly9wcm9udG8uZ2V0c3RyZWFtLmlvIiwic3ViIjoidXNlci9QcmluY2VfWGl6b3IiLCJpYXQiOjE3MjQxMzU4NTYsImV4cCI6MTcyNDc0MDY2MX0.W60BL9ea4agFxfdcetoJ63acq7DBzcDsMvtJpVn-mXE",
    );


    print('widget.token.characters .....................${widget.token.characters}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Create Call'),
          onPressed: () async {
            try {
              var call = StreamVideo.instance.makeCall(
                // ignore: deprecated_member_use
                callType: StreamCallType(),
                id: 'wNhNhgBqUGJg ',
              );

              await call.getOrCreate();

              // Navigate to CallScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallScreen(call: call),
                ),
              );
            } catch (e) {
              debugPrint('Error joining or creating call: $e');
              debugPrint(e.toString());
            }
          },
        ),
      ),
    );
  }
}
