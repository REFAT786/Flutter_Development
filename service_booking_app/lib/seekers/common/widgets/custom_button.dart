import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';
import 'package:service_booking_app/seekers/utils/dimensions.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';

import '../../utils/app_string.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.buttonText});
  String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
          color: buttonText==AppString.skip? AppColors.primary100:AppColors.primary,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Center(
          child: buttonText==AppString.skip?Text(
            "$buttonText",
            style:
             TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeSixteen),
          ):Text(
            "$buttonText",
            style: styleExtraBold.copyWith(color: AppColors.white,fontSize: Dimensions.fontSizeSixteen, height: 1.40, letterSpacing: 0.20),
          )
      ),
    );
  }
}
