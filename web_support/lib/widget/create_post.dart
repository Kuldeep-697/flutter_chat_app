import 'package:flutter/material.dart';
import 'package:web_support/models/user_model.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

      child: Column(
        children: [
          Row(
            children :  [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(currentUser.imageUrl),
              ),
            
              const SizedBox(width: 12),
            
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What\'s on your mind?',
                      hintStyle: TextStyle(
                      fontSize: 16
                    ),
                    border : InputBorder.none,
                  ),
                ),
              ),
            ]
          ),
    
          const Divider(thickness: 3),
          
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},                    
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ), 
                  label: const Text('Live'),
                ),
            
                TextButton.icon(
                  onPressed: () {} , 
                  icon: const Icon(
                    Icons.collections,
                    color: Colors.green,
                  ), 
                  label: const Text('Photo'),
                ),
            
                TextButton.icon(
                  onPressed: () {} , 
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ), 
                  label: const Text('Room'),
                ), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}