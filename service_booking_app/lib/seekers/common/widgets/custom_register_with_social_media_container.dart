import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';

class CustomRegisterWithSocialMediaContainer extends StatelessWidget {
  CustomRegisterWithSocialMediaContainer({super.key, required this.iconName, required this.text, required this.color});
  IconData iconName;
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(iconName, color: color,size: 25,),
          SizedBox(width: 10,),
          Text(text, style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),),
        ],
      ),

    );
  }
}
