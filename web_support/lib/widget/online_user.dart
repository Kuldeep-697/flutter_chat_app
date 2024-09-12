import 'package:flutter/material.dart';
import 'package:web_support/config/palette.dart';
import 'package:web_support/models/user_model.dart';

class OnlineUser extends StatelessWidget {
  const OnlineUser({super.key, required this.onlineUsers});

  final List<User> onlineUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: Palette.facebookBlue,
                width: 3,
              ),
            ),

            child : TextButton.icon(
              onPressed: () {}, 
              icon: const Icon(                
                Icons.duo_sharp,
                color: Colors.purple,
              ), 
              label: const Text('Create room'),
            ),
          ),

          const SizedBox(width: 8),
          
          Expanded(
            child: SizedBox(
              height: 50,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: onlineUsers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children : [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(onlineUsers[index].imageUrl),                        
                      ),
          
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.online,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ]                  
                  );
                },
              ),
            ),
          ),
        ]
      ),
    );
  }
}
