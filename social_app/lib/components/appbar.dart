import 'package:flutter/material.dart';
import 'package:social_app/styles/app_colors.dart';
import 'package:social_app/styles/app_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Text(
        title,
        style: AppText.header1,
      ),
      actions: actions
    );
  }
  
  @override
   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

