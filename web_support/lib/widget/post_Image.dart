import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.postImageUrl});

  final String postImageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      postImageUrl,
      fit: BoxFit.cover,
    );
  }
}
