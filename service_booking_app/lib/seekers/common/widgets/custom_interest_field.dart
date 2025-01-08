import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class CustomInterestField extends StatelessWidget {
   CustomInterestField({super.key, required this.name, required this.icon});
  String name;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.secondary100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black ,
            spreadRadius: 0,
            blurRadius: 2,
            offset:  Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Text(name,  style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 13,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w800,
          ),),
          Icon(icon, size: 16,),

        ],
      ),
    );
  }
}
