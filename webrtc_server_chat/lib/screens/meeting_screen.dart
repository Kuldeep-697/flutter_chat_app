// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_webrtc_wrapper/flutter_webrtc_wrapper.dart';
import 'package:webrtc_server_chat/models/meeting_details.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:webrtc_server_chat/screens/home_screens.dart';
import 'package:webrtc_server_chat/utils/user.utils.dart';
import 'package:webrtc_server_chat/widgets/control_pannal.dart';
import 'package:webrtc_server_chat/widgets/remote_connection.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen(
      {super.key, this.meetingId, this.name, required this.meetingDetail});

  final String? meetingId;
  final String? name;
  final MeetingDetail meetingDetail;

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final _localRenderer = RTCVideoRenderer();
  final Map<String, dynamic> mediaConstraints = {"audio": true, "video": true};
  bool isConnectionFailed = false;
  WebRTCMeetingHelper? meetingHelper; 

   @override
  void initState() {
    super.initState();
    initRenderers();
    startMeeting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          meetingHelper != null && meetingHelper!.connections.isNotEmpty
          ? GridView.count(
              crossAxisCount: meetingHelper!.connections.length < 3 ? 1 : 2,  
              children: List.generate(
                meetingHelper!.connections.length, 
                (index) {
                  return Padding(
                    padding: EdgeInsets.all(1),
                    child: RemoteConnection(
                      renderer: meetingHelper!.connections[index].renderer, 
                      connection: meetingHelper!.connections[index]
                    ),
                  );
                }
              ),
            )
          : Center(
            child: Text(
              'Waiting for participants to join the meeting',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: SizedBox(
              width: 150,
              height: 200,
              child: RTCVideoView(_localRenderer),
            )
          )  
        ],
      ),  
      bottomNavigationBar: ControlPannal(
        onAudioToggle: onAudioToggle,
        onVideoToggle: onVideoToggle,
        videoEnabled: isVideoEnabled(),
        audioEnabled: isAudioEnabled(),
        isConnectionFailed: isConnectionFailed,
        onReconnect: handleReconnect,
        onMeetingEnd: onMeetingEnd,
      ),
    );
  }

  void startMeeting() async {
    final String userId = await loadUserId();
    meetingHelper = WebRTCMeetingHelper(
        url: 'http://localhost:4000',
        meetingId: widget.meetingDetail.id,
        userId: userId,
        name: widget.name
    );

    MediaStream localSream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);

    _localRenderer.srcObject = localSream;
    meetingHelper!.stream = localSream;

    meetingHelper!.on("open", context, (ev, context) {
      print('Meeting opened');
      setState(() {
        isConnectionFailed = false;
      });
    });

    meetingHelper!.on("connection", context, (ev, context) {
      print('Connection established');
      setState(() {
        isConnectionFailed = false;
      });
    });

    meetingHelper!.on("user-left", context, (ev, context) {
      print('User left');
      setState(() {
        isConnectionFailed = false;
      });
    });

    meetingHelper!.on("video-toggle", context, (ev, context) {
      print('Video toggled');
      setState(() {});
    });

    meetingHelper!.on("audio-toggle", context, (ev, context) {
      print('Audio toggled');
      setState(() {});
    });

    meetingHelper!.on("meeting-ended", context, (ev, context) {
      print('Meeting ended');
      onMeetingEnd();
    });

    meetingHelper!.on("connection-setting-changed", context, (ev, context) {
      print('Connection settings changed');
      setState(() {
        isConnectionFailed = false;
      });
    });

    meetingHelper!.on("stream-changed", context, (ev, context) {
      print('Stream changed');
      setState(() {
        isConnectionFailed = false;
      });
    });
    

    setState(() {});
  }

  initRenderers() async {
    await _localRenderer.initialize();
  }

  @override
  void deactivate() {
    super.deactivate();
    _localRenderer.dispose();
    if (meetingHelper != null) {
      meetingHelper!.destroy();
      meetingHelper = null;
    }
  }

  void onMeetingEnd() {
    if (meetingHelper != null) {
      meetingHelper!.endMeeting();
      meetingHelper = null;
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  void onAudioToggle() {
    if (meetingHelper != null) {
      setState(() {
        meetingHelper!.toggleAudio();
      });
    }
  }

  void onVideoToggle() {
    if (meetingHelper != null) {
      setState(() {
        meetingHelper!.toggleVideo();
      });
    }
  }

  void handleReconnect() {
    if (meetingHelper != null) {
      meetingHelper!.reconnect();
    }
  }

  bool isVideoEnabled() {
    return meetingHelper != null ? meetingHelper!.videoEnabled! : false;
  }

  bool isAudioEnabled() {
    return meetingHelper != null ? meetingHelper!.audioEnabled! : false;
  }

}
