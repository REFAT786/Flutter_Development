import 'package:flutter/material.dart';

class CustomGender extends StatelessWidget {
  CustomGender({super.key, required this.genderIcon, required this.genderText, required this.isSelected});

  String genderText;
  IconData genderIcon;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff272A2F),
        border: isSelected
            ? Border.all(color: const Color(0xffD0952E), width: 2) // Orange border if selected  (0xffEFA931)
            : null, // No border if not selected
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1),

          ),
        ],
      ),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Icon(genderIcon, size: 60, color: isSelected ? const Color(0xff89CFEF) : Colors.white,),
          Text(genderText, style: const TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
