import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import 'custom_container_icon.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.number,
    this.suffixBGColor,
    this.suffixIcon,
    this.suffixIconColor,
  });

  final int? number;
  final Color? suffixBGColor, suffixIconColor;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (suffixBGColor != null &&
            suffixIcon != null &&
            suffixIconColor != null)
          CustomContainerIcon(
            bgColor: suffixBGColor!,
            icon: suffixIcon!,
            iconColor: suffixIconColor!,
          ),
        if (number != null)
          Positioned(
            top: -7,
            right: -3,
            child: CircleAvatar(
              backgroundColor: AppColor.orange,
              radius: 12,
              child: Text(
                "$number",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
