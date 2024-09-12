import 'package:flutter/material.dart';
import 'package:web_support/config/palette.dart';
import 'package:web_support/widget/navigation_icons.dart';

class WebAppBar extends StatefulWidget{
  const WebAppBar({super.key});

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  
   Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment : MainAxisAlignment.spaceBetween,          
        children : [
          const Text(
            'facebook',              
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1
            ),
          ),
          
          NavigationIcons(
            selectPage: _selectPage,
            selectedPageIndex: _selectedPageIndex,
          ),
        
          const Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1
            ),
          ),
        ],
    );
  }
}