import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_color.dart';
import '../../utils/dimensions.dart';

class CustomActivityContainer extends StatelessWidget {
   CustomActivityContainer({super.key, required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey ,
            spreadRadius: 0,
            blurRadius: 2,
            offset:  Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Text(name,  style: TextStyle(
        color: Color(0xFF0C0C0C),
        fontSize: 13,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w800,
      ),),
    );
  }
}
