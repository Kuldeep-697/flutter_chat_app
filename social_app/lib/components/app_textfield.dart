import 'package:flutter/material.dart';
import 'package:social_app/styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.labelTitle});

  final String labelTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelTitle,
          filled: true,
          fillColor: AppColors.white,
          border: InputBorder.none,
          labelStyle: const TextStyle(color: Color(0xFF1F305E)),
        ),
        cursorColor: const Color(0xFF1F305E),
      ),
    );
  }
}
