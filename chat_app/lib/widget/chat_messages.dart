import 'package:chat_app/widget/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current authenticated user
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        // While waiting for data it shows Circular progress bar
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // If are no messages found
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages found...'),
          );
        }

        // If there's an error with the stream
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }

        // Extract the list of loaded messages from the snapshot
        final loadedMessages = snapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 20, left: 13, right: 13),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (ctx, index) {
            // Extract current message and the next message
            final chatMessage = loadedMessages[index].data();
            final nextChatMessage = index + 1 < loadedMessages.length
                ? loadedMessages[index + 1].data()
                : null;

            // Extract user IDs of the current and next chat messages
            final currentMessageUserId = chatMessage['userId'];
            final nextMessageUserId = nextChatMessage != null 
                                        ? nextChatMessage['userId'] 
                                        : null;

            // check message is from same user or not
            final userIsSame = nextMessageUserId == currentMessageUserId;

            if (userIsSame) {
              return MessageBubble.next(
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            } 
            else {
              return MessageBubble.first(
                userImage: chatMessage['userImage'],
                username: chatMessage['username'],
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            }
          },
        );
      },
    );
  }
}
