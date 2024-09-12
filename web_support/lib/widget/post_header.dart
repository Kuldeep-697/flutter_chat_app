import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.userProfilePhotoUrl,
    required this.username,
    required this.postTimeAgo,
    required this.postIconOnPressed,
    required this.postCaption,
  });

  final String userProfilePhotoUrl;
  final String username;
  final String postTimeAgo;
  final void Function() postIconOnPressed;
  final String postCaption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18 ,vertical:8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(userProfilePhotoUrl),
              ),
    
              const SizedBox(width: 8),
                  
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
          
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$postTimeAgo • ',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.public,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    
                  )
                ],
              ),
    
              const Spacer(),
    
              IconButton(
                onPressed: postIconOnPressed, 
                icon: const Icon(Icons.more_horiz)
              )
            ],
          ),

          const SizedBox(height: 12),
    
          Text(
            postCaption,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 15,
              letterSpacing:0.5,
            ), 
          ),
        ],
      ),
    );
  }
}