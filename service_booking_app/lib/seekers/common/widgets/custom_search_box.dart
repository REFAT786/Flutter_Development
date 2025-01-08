import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox(
      {super.key,
      required this.hintText,
      required this.controller});

      final String hintText;
      final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(Icons.search, color: AppColors.secondary550, size: 20,),
          suffixIcon: Icon(Icons.mic, color: AppColors.secondary550, size: 20,),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.secondary550, fontSize: 15),
        ),
      ),
    );
  }
}
