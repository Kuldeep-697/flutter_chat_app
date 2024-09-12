import 'package:flutter/material.dart';
import 'package:social_app/components/appbar.dart';
import 'package:social_app/config/app_routes.dart';
import 'package:social_app/config/app_strings.dart';
import 'package:social_app/styles/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppStrings.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                  break;

                case ProfileMenu.logout :
                  print('logout');
                  break;
              }
          }, 
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: ProfileMenu.edit,
                child: Text(AppStrings.edit),
              ),
              const PopupMenuItem(
                value: ProfileMenu.logout,
                child: Text(AppStrings.logout),
              )
            ];
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/myImage.jpeg',
                width: 90,
                height: 90,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Kuldeep prajapati',
              style: AppText.header2,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFFBD512),
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'New Delhi, India',
                  style: AppText.subtitle3,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      '119',
                      style: AppText.header2,
                    ),
                    Text(AppStrings.posts),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '472',
                      style: AppText.header2,
                    ),
                    Text(AppStrings.followers),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '860',
                      style: AppText.header2,
                    ),
                    Text(AppStrings.following),
                  ],
                ),
              ],
            ),
            const Divider(thickness: 2, height: 30),
          ],
        ),
      ),
    );
  }
}
