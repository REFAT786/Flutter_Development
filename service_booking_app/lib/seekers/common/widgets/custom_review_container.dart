import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/utils/images.dart';

class CustomReviewContainer extends StatelessWidget {
  const CustomReviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 128,
            width: 276,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(image: NetworkImage(Images.serviceCoverImage),fit: BoxFit.cover,)
          ),
         
          SizedBox(height: 10,),
          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(Images.serviceShortPhoto),
              ),
              SizedBox(width: 5,),
              Text("Name"),
              Text(" - 2 day's ago"),

            ],
          ),
          SizedBox(height: 5,),
          Text(
            'Great Companion!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4,),
          Text(
            'Aurelia was fantastic. Very friendly and knowledgeable about the hiking trails.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
              height: 1.35,
            ),
          ),

        ],
      ),
    );
  }
}
