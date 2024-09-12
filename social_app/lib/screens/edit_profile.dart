import 'package:flutter/material.dart';
import 'package:social_app/components/app_textfield.dart';
import 'package:social_app/components/appbar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: 'Edit profile'),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          children: const [
            AppTextField(labelTitle: 'username'),
            SizedBox(height: 8),
            AppTextField(labelTitle: 'password'),
            SizedBox(height: 8),
            AppTextField(labelTitle: 'username'),
            SizedBox(height: 8),
            AppTextField(labelTitle: 'password'),
          ],
        ));
  }
}
