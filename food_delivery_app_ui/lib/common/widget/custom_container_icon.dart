import 'package:flutter/material.dart';

class CustomContainerIcon extends StatelessWidget {
  const CustomContainerIcon({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.iconColor,
  });

  final Color bgColor, iconColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor,
      radius: 22,
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
