// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:webrtc_server_chat/api/meeting_api.dart';
import 'package:webrtc_server_chat/models/meeting_details.dart';
import 'package:webrtc_server_chat/screens/join_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String meetingId = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting App'),
        backgroundColor: Colors.redAccent,
      ),
      body: Form(
        key: globalKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to WebRTC Meeting App',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                SizedBox(height: 20),
                FormHelper.inputFieldWidget(
                  context,
                  "meetingId",
                  "Enter your Meeting Id",
                  (val) {
                    if (val.isEmpty) {
                      return "Meeting id cannot be empty";
                    }
                    return null;
                  },
                  (onSaved) {
                    meetingId = onSaved;
                  },
                  borderRadius: 10,
                  borderFocusColor: Colors.redAccent,
                  borderColor: Colors.redAccent,
                  hintColor: Colors.grey,
                ),
                SizedBox(height: 20),
                isLoading
                ? CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: FormHelper.submitButton(
                          'Join Meeting',
                          () {
                            print('Ontapped of Join Meeting');
                            if (validateAndSave()) {
                              validateMeeting(meetingId);
                            }
                          },
                        ),
                      ),
                      Flexible(
                        child: FormHelper.submitButton(
                          'Start Meeting',
                          () async {
                            setState(() {
                              isLoading = true;
                            });
                            print('Ontapped of Start Meeting');
                            var response = await startMeeting();
                            print(response!.body);
                            final body = json.decode(response.body);
                            final meetId = body['data'];

                            print('meetId is $meetId');

                            validateMeeting(meetId);
                          },
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateMeeting(String meetingId) async {
    print('inside validateMeeting. . . . .');

      setState(() {
        isLoading = true;
      });

    try {
      Response response = await joinMeeting(meetingId);

      print('inside validateMeeting response $response. . . . .');
      print(
          'inside validateMeeting responseCode ${response.statusCode}. . . . . .');

      var data = json.decode(response.body);
      final meetingDetails = MeetingDetail.fromJson(data["data"]);
      print(meetingDetails.hostId);
      goToJoinScreen(meetingDetails);
    } 
    catch (error) {
      print('inside validateMeeting catch . . . . .');
      FormHelper.showSimpleAlertDialog(
        context,
        "Meeting App",
        "Invalid Meeting Id",
        "OK",
        () {
          Navigator.of(context).pop();
        },
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  goToJoinScreen(MeetingDetail meetingDetail) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => JoinScreen(
          meetingDetail: meetingDetail,
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }
}
