import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/dimensions.dart';

class CustomPinBoxWidget extends StatelessWidget {
  const CustomPinBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: Dimensions.paddingSizeTwenty,
          right: Dimensions.paddingSizeTwenty,
          top: Dimensions.paddingSizeTen,
          bottom: Dimensions.paddingSizeTen),
      width: 60,
      decoration: BoxDecoration(
        color: AppColor.whiteThree,
        borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
      ),
      child: const TextField(
        cursorColor: AppColor.black,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
