import 'package:flutter/material.dart';
import 'package:web_support/models/story_model.dart';
import 'package:web_support/models/user_model.dart';
import 'package:web_support/widget/story_card.dart';

class UserStory extends StatelessWidget {
  const UserStory({super.key, required this.currentUser, required this.stories});

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,

        itemBuilder: (context, index) {
          if(index == 0) {            
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: StoryCard(
                isAddStory : true,
                currentUser : currentUser,
              ),
            );
          }

          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: StoryCard(
              story : story
            ),
          );
        },
      ),
    );
  }
}
