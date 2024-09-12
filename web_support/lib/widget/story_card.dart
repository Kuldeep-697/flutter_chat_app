import 'package:flutter/material.dart';
import 'package:web_support/config/palette.dart';
import 'package:web_support/models/story_model.dart';
import 'package:web_support/models/user_model.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, this.isAddStory = false, this.currentUser, this.story});
  
   final bool? isAddStory;
   final User? currentUser; 
   final Story? story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            isAddStory! ? currentUser!.imageUrl : story!.imageUrl,
            width: 110,
            height: double.infinity,    
            fit: BoxFit.cover,
          ),
        ),

        // showing gradient theme when story is loading
        Container(
          width: 110,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12)
          ),
        ),

        Positioned(
          left : 8, top: 8,
          child: isAddStory!
              ? GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Palette.facebookBlue,
                    )
                  ),
              )
              : CircleAvatar(
                backgroundColor: Palette.facebookBlue,
                radius: 20,
                child: CircleAvatar(
                  radius: 17,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(story!.user.imageUrl),
                ),
              ),
        ),

        Positioned(
          left : 8, bottom: 5, 
          child: Text(
            isAddStory!
            ? 'Add to Story'
            : story!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
            maxLines: 2,
          )
        )
      ]  
    );
  }
}