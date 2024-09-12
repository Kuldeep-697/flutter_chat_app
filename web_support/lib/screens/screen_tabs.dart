import 'package:flutter/material.dart';
import 'package:web_support/config/palette.dart';
import 'package:web_support/screens/home_page.dart';
import 'package:web_support/widget/appbar_button.dart';
import 'package:web_support/widget/navigation_icons.dart';
import 'package:web_support/widget/responsive.dart';
import 'package:web_support/widget/web_appbar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _screens = const [
    HomePage(),
    Scaffold(body: Center(child: Text('Videos'))),
    Scaffold(body: Center(child: Text('Profile'))),
    Scaffold(body: Center(child: Text('Groups'))),
    Scaffold(body: Center(child: Text('Notifications'))),
    Scaffold(body: Center(child: Text('Menu'))),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Responsive.isDesktop(context) 
      ? PreferredSize(
          preferredSize: Size(screenSize.width, 100),
          child: const WebAppBar()
        ) 
      : AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1
          ),
        ),
        actions: [
          AppBarButton(
            icon: const Icon(Icons.search),
            iconSize: 26,
            onPressed: () {
              print('search');
            }
          ),
          AppBarButton(
            icon: const Icon(Icons.message_outlined),
            iconSize: 26,
            onPressed: () {
              print('message');
            }
          ),
        ],
      ),

      body: _screens[_selectedPageIndex],

      bottomNavigationBar: Responsive.isMobile(context) 
      ? NavigationIcons(
          selectPage: _selectPage,
          selectedPageIndex: _selectedPageIndex,
        )  
      : null,
    );
  }
}
