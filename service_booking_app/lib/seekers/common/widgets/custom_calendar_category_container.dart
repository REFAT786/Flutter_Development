import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';

class CustomCalendarCategoryContainer extends StatelessWidget {
  const CustomCalendarCategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 247,
      width: 196,
      padding: const EdgeInsets.all(10),
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
          child: Image(image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/024/669/482/small_2x/mountain-countryside-landscape-at-sunset-dramatic-sky-over-a-distant-valley-green-fields-and-trees-on-hill-beautiful-natural-landscapes-of-the-carpathians-generative-ai-variation-8-photo.jpeg"))),
          SizedBox(height: 5,),
          Text("Art", style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 5,),
          Text("Friday", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.primary,),
              Text("Dhaka")
            ],
          )
        ],
      ),

    );
  }
}
