import 'package:flutter/material.dart';

class NavigationIcons extends StatelessWidget {
  const NavigationIcons({
    Key? key,
    required this.selectedPageIndex,
    required this.selectPage,
  }) : super(key: key);

  final Function(int) selectPage;
  final int selectedPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () => selectPage(0),
          color: selectedPageIndex == 0
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),

        IconButton(
          icon: const Icon(Icons.ondemand_video),
          onPressed: () => selectPage(1),
          color: selectedPageIndex == 1
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),

        IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () => selectPage(2),
          color: selectedPageIndex == 2
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),

        IconButton(
          icon: const Icon(Icons.group_outlined),
          onPressed: () => selectPage(3),
          color: selectedPageIndex == 3
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
        
        IconButton(
          icon: const Icon(Icons.doorbell_rounded),
          onPressed: () => selectPage(4),
          color: selectedPageIndex == 4
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),

        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => selectPage(5),
          color: selectedPageIndex == 5
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
      ],
    );
  }
}


class NavIconButton extends StatelessWidget {
  const NavIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final int index;
  final bool isSelected;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => onPressed(index),
      color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
      tooltip: label,
    );
  }
}
