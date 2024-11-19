import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/utils/dimensions.dart';

import '../../../../utils/app_color.dart';

class CustomAllCategoryFoodSingleContainer extends StatelessWidget {
  const CustomAllCategoryFoodSingleContainer({super.key,
    required this.foodImage,required this.foodName,
    this.price,
    this.onTapFoodCategory
  });
  final String foodImage;
  final String foodName;
  final double ?price;
  final VoidCallback? onTapFoodCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFoodCategory,
      child: Padding(
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
                padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Starting"),
                        const SizedBox(width: Dimensions.marginSizeFifteen,),
                        Text("\$ $price", style: const TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              )
              //condition
            ],
          ),
        ),
      ),
    );
  }
}
