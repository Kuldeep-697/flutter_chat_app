import 'package:flutter/material.dart';
import 'package:web_support/config/palette.dart';

class PostStats extends StatelessWidget {
  const PostStats({
    super.key,
    required this.postLikes,
    required this.postComments,
    required this.postShares,
  });

  final String postLikes;
  final String postComments;
  final String postShares;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width : 18),

        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.facebookBlue,
          ),
          child: const Icon(
            Icons.thumb_up_off_alt_rounded, 
            size : 12,
            color: Colors.white,
          )
        ),

        const SizedBox(width : 6),

        Text(
          postLikes,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            letterSpacing:0.5,
          ), 
        ),

        const Spacer(),

        Text(
          postComments,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            letterSpacing:0.5,
          ), 
        ),

        const SizedBox(width : 6),

        Text(
          postShares.toString(),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            letterSpacing:0.5,
          ), 
        ),

        const SizedBox(width : 18),
      ],
    );
  }
}