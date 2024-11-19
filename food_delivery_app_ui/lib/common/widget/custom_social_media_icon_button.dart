import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/utils/dimensions.dart';

class CustomSocialMediaIconButton extends StatelessWidget {
  const CustomSocialMediaIconButton({super.key, required this.icon, required this.color, required this.bgColor});
  final IconData icon;
  final Color color, bgColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor,
      radius: Dimensions.radiusTwentyFive,
      child: Icon(icon,size: 40, color: color,),
    );
  }
}
