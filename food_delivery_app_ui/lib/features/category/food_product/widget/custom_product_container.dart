import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';

class CustomProductContainer extends StatelessWidget {
  const CustomProductContainer({super.key,
    required this.foodImage,
    required this.foodName,
    required this.restaurantName,
    required this.price,
    required this.onPressedCardIcon
  });

  final String foodImage;
  final String foodName;
  final String restaurantName;
  final double price;
  final VoidCallback? onPressedCardIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeFive),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusTwenty),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),

          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(foodImage,height: 100, width: 120,),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10,right: 10, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName),
                    Text(restaurantName),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold),),
                        IconButton(
                          onPressed: onPressedCardIcon,
                          icon: const Icon(Icons.add_circle,color: AppColor.orange,size: 35,),
                        )
                      ],
                    )
                  ],
                ),

              ),

              //condition
            ],
          ),
        ),
      );
  }
}
