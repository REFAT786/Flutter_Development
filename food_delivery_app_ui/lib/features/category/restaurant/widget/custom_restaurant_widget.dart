import 'package:flutter/material.dart';

import '../../foood_category/model/food_category_data.dart';
import '../../../../utils/app_color.dart';

class CustomRestaurantWidget extends StatelessWidget {
  const CustomRestaurantWidget({
    super.key,
    required this.restaurantImage,
    required this.restaurantName,
    required this.foodCategoryList,
    required this.restaurantReview,
    required this.shippingStatus,
    required this.durationTime,
  });

  final String restaurantImage, restaurantName, shippingStatus;
  final double restaurantReview, durationTime;
  final List<FoodCategoryData> foodCategoryList;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                restaurantImage,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
            // Restaurant Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                restaurantName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            // Food Categories
            if (foodCategoryList.isNotEmpty)
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodCategoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Chip(
                        label: Text(foodCategoryList[index].foodCategoryName!),
                        backgroundColor: AppColor.white,
                      ),
                    );
                  },
                ),
              ),
            // Restaurant Details
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Review
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColor.orange, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        '$restaurantReview',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  // Shipping
                  Row(
                    children: [
                      const Icon(Icons.local_shipping, color: AppColor.orange, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        shippingStatus,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  // Duration
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: AppColor.orange, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        '$durationTime mins',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
