import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.onPressed
  });

  final Icon icon;
  final double iconSize;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],                                                      
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed, 
        icon: icon,
        iconSize : iconSize,
        color: Colors.black,
      ),
    );
  }
}
