import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/config/app_strings.dart';
import 'package:social_app/screens/home_page.dart';
import 'package:social_app/screens/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = [
    const HomePage(),
    const Center(child: Text('Favorite')),
    const Center(child: Text('Message')),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/home_icon.svg',
                width: 24,
                height: 24,
              ),
              label: AppStrings.home
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/heart_icon.svg',
              width: 24,
              height: 24,
            ),
            label: AppStrings.favorites
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/messages.svg',
                width: 24,
                height: 24,
              ),
              label: AppStrings.messages
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/user.svg',
                width: 24,
                height: 24,
              ),
              label: AppStrings.user
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
