import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:webrtc_server_chat/models/meeting_details.dart';
import 'package:webrtc_server_chat/screens/meeting_screen.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key, this.meetingDetail});

  final MeetingDetail? meetingDetail;

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Meeting'),
        backgroundColor: Colors.redAccent,
      ),
      body: Form(
        key: globalKey,
        child: formUI(context),
      ),
    );
  }

  Widget formUI(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormHelper.inputFieldWidget(context, "userId", "Enter your Name",
                (val) {
              if (val.isEmpty) {
                return "Name cannot be empty";
              }
              return null;
            }, (onSaved) {
              userName = onSaved;
            },
                borderRadius: 10,
                borderFocusColor: Colors.redAccent,
                borderColor: Colors.redAccent,
                hintColor: Colors.grey),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    child: FormHelper.submitButton('Join', () {
                  if (validateAndSave()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeetingScreen(
                          meetingId: widget.meetingDetail!.id,
                          name: userName,
                          meetingDetail: widget.meetingDetail!,
                        ),
                      ),
                    );
                  }
                })),
              ],
            ),
          ],
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
