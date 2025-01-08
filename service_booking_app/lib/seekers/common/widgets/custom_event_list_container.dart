import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';

import '../../utils/images.dart';

class CustomEventListContainer extends StatelessWidget {
  CustomEventListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      //width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey ,
            spreadRadius: 0,
            blurRadius: 2,
            offset:  Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(image: NetworkImage(Images.serviceCoverImage), height: 115, width: 160,fit: BoxFit.cover,)
          ),
          SizedBox(height: 5,),
          Text("Art", style: TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),SizedBox(height: 5,),
          Text("Friday", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
          SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.primary,),
              Text("Dhaka",style: TextStyle(overflow: TextOverflow.ellipsis),)
            ],
          )
        ],
      ),

    );
  }
}
