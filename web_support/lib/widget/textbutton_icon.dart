import 'package:flutter/material.dart';

class TextButtonIcon extends StatelessWidget {
  const TextButtonIcon({
    super.key,
    required this.iconLabel,
    required this.onPressed,
    this.labelColor,
    this.labelSize,
    required this.buttonIcon,
    this.iconSize,
  });

  final void Function() onPressed;
  final String iconLabel;
  final Color? labelColor;
  final double? labelSize;
  final IconData buttonIcon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        iconLabel,
        style: TextStyle(color : labelColor, fontSize : labelSize),
      ),
      icon: Icon(buttonIcon, size: iconSize),
    );
  }
}
