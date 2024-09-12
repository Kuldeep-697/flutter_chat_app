import 'package:flutter/material.dart';
import 'package:web_support/models/post_model.dart';
import 'package:web_support/widget/post_Image.dart';
import 'package:web_support/widget/post_header.dart';
import 'package:web_support/widget/post_stats.dart';
import 'package:web_support/widget/textbutton_icon.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key, required this.posts}) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: posts.map((post) {
            final userProfilePhoto = post.user.imageUrl;
            final username = post.user.name;
            final postCaption = post.caption;
            final postImage = post.imageUrl;
            final postLikes = post.likes;
            final postComments = '${post.comments} Comments';
            final postShares = '${post.shares} Shares';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(
                  userProfilePhotoUrl: userProfilePhoto,
                  username: username,
                  postTimeAgo: post.timeAgo,
                  postIconOnPressed: () {
                    print('Edit profile...');
                  },
                  postCaption: postCaption,
                ),

                const SizedBox(height: 8),

                PostImage(postImageUrl: postImage),

                const SizedBox(height: 8),

                PostStats(
                  postLikes: postLikes.toString(),
                  postComments: postComments.toString(),
                  postShares: postShares.toString(),
                ),

                const Divider(thickness: 1),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,                   
                  children: [                    
                    TextButtonIcon(
                      onPressed: () {
                        print('Like ...');
                      },
                      iconLabel: 'Like',
                      labelColor: Colors.black,
                      labelSize: 14,
                      buttonIcon: Icons.thumb_up,
                      iconSize: 18,
                    ),
                    TextButtonIcon(
                      onPressed: () {
                        print('Comment');
                      },
                      iconLabel: 'Comment',
                      labelColor: Colors.black,
                      labelSize: 14,
                      buttonIcon: Icons.comment,
                      iconSize: 18,
                    ),
                    TextButtonIcon(
                      onPressed: () {
                        print('Share');
                      },
                      iconLabel: 'Share',
                      labelColor: Colors.black,
                      labelSize: 14,
                      buttonIcon: Icons.share,
                      iconSize: 18,
                    )
                  ],
                ),

                const Divider(thickness: 8),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
