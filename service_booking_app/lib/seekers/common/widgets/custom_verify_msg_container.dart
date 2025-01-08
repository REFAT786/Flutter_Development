import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_color.dart';
import '../../utils/styles.dart';

class CustomVerifyMsgContainer extends StatelessWidget {
  CustomVerifyMsgContainer({super.key, required this.iconName, required this.title, required this.subTitle, this.isSelected=false});
  IconData iconName;
  String title, subTitle;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              padding: EdgeInsets.all(15),
              color: AppColors.primary50,
              child: FaIcon(iconName, color: AppColors.primary,size: 20,),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${title}:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.subTitleColor),),
              Text(subTitle, style: styleBold,)
            ],
          )
        ],
      ),

    );
  }
}
