import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/dimensions.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key, required this.hintText, required this.prefixIcon, this.suffixIcon});
  final String hintText;
  final IconData prefixIcon;
  final IconData ?suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeFive),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.whiteThree,
          borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeFifteen),
            prefixIcon: Icon(prefixIcon, color: Colors.grey,size: 15,),
            suffixIcon: suffixIcon !=null ?
                Icon(suffixIcon, color: Colors.grey, size: 15,): null,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),

          ),
        )
    );
  }
}
