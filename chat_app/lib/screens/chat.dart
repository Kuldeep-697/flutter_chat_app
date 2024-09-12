import 'package:chat_app/widget/chat_messages.dart';
import 'package:chat_app/widget/new_message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;

    // Request permission for push notifications
    await fcm.requestPermission();

    // Subscribe to a topic for receiving push notifications
    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();
    setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter chat'),
        actions: [
          IconButton(
              onPressed: () {
                // Sign out the current user
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              )
          )
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: ChatMessages()
          ), 
          NewMessage()
        ],
      )
    );
  }
}
