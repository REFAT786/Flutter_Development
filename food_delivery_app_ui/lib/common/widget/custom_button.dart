import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/utils/dimensions.dart';

import '../../utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText});
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.orange,
        borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
      ),
      child: Center(
          child: Text(
        buttonText,
        style:
            const TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
      )),
    );
  }
}
