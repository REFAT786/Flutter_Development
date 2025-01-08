import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';
import 'package:service_booking_app/seekers/utils/dimensions.dart';

class CustomIconContainer extends StatelessWidget {
  CustomIconContainer({super.key, required this.iconName, required this.color});
  IconData iconName;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeFifteen, horizontal: Dimensions.paddingSizeTwenty),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.borderColor,
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1)

          )
        ]
      ),
      child: FaIcon(iconName, color: color,size: Dimensions.radiusTwentyFour,),
    );
  }
}
