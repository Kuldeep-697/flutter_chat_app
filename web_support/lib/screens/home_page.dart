import 'package:flutter/material.dart';
import 'package:web_support/data/post_data.dart';
import 'package:web_support/data/story_data.dart';
import 'package:web_support/data/user_data.dart';
import 'package:web_support/widget/create_post.dart';
import 'package:web_support/widget/online_user.dart';
import 'package:web_support/widget/user_post.dart';
import 'package:web_support/widget/user_story.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                                                       
      body: SingleChildScrollView(
        child: Column(  
          children: [
            const CreatePost(currentUser : currentUser),
            
            const SizedBox(height: 6),
        
            const OnlineUser(onlineUsers : onlineUsers),
        
            const SizedBox(height: 6),
        
            UserStory(currentUser: currentUser, stories : stories),
          
            const SizedBox(height: 6),
        
            PostContainer(posts : posts),            
          ],
        ),
      ),
    );
  }
}
