import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webrtc_server_chat/utils/user.utils.dart';

// ignore: non_constant_identifier_names
String meetingApiUrl = "http://localhost:4000/api/meeting";
var client = http.Client();

Future<http.Response?> startMeeting() async {
  print('Inside startMeeting................');

  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

  var userId = await loadUserId();

  print('UserId is .........$userId');

  var response = await client.post( 
    Uri.parse('$meetingApiUrl/start'),
    headers: requestHeaders,
    body: jsonEncode({'hostId': userId, 'hostName': ''}),
  );

  print('Inside startMeeting $response................');
  print(
      'Inside startMeeting statusCode ${response.statusCode} ................');

  if (response.statusCode == 200) {
    print(response);
    return response;
  } else {
    return null;
  }
}

Future<http.Response> joinMeeting(String meetingId) async {
  print('inside joinMeeting. . . . .');

  var response = await http.get(
    Uri.parse('$meetingApiUrl/join?meetingId=$meetingId')
  );

  print('inside joinMeeting response ${response}. . . . . .');
  print('inside joinMeeting responseCode ${response.statusCode}. . . . . .');

  if (response.statusCode == 200) {
    return response;
  }

  print('Not a valid Meeting ,Cannot able to join');
  throw UnsupportedError('Not a valid Meeting');
}
