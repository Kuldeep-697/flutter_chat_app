import 'package:flutter/material.dart';
import 'package:social_app/styles/app_colors.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/images/myImage.jpeg', width: 40, height: 40),
            const SizedBox(width: 12),
            const Text(
              'Kuldeep prajapati',
              style: TextStyle(
                color: AppColors.white,                
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        Image.asset('assets/images/post1.png', width: double.infinity),
      ],
    );
  }
}
