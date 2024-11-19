import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/common/widget/custom_app_bar.dart';
import 'package:food_delivery_app_ui/features/category/restaurant/model/restaurant_data.dart';
import 'package:food_delivery_app_ui/features/category/restaurant/screen/restaurant_screen.dart';
import 'package:food_delivery_app_ui/utils/app_color.dart';
import 'package:get/get.dart';

import '../widget/custom_restaurant_widget.dart';

class RestaurantCategoryScreen extends StatelessWidget {
  const RestaurantCategoryScreen({super.key, this.restaurantList});
  final List<RestaurantData>? restaurantList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                  onTapButton: (){
                    Get.back();
                  },
                  leadingBGColor: AppColor.whiteThree,
                  leadingIcon: Icons.arrow_back_ios_new,
                  leadingIconColor: AppColor.black,
                  title: "All Restaurants",
                  titleColor: AppColor.black),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true, // Ensures the list takes up only the needed space
                  itemCount: restaurantList?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: CustomRestaurantWidget(
                        restaurantImage: restaurantList![index].restaurantImageList![0],
                        restaurantName: restaurantList![index].restaurantName!,
                        foodCategoryList: restaurantList![index].restaurantFoodCategoryList!,
                        restaurantReview: restaurantList![index].restaurantReview!,
                        shippingStatus: restaurantList![index].deliveryType!,
                        durationTime: restaurantList![index].duration!,
                      ),
                      onTap: (){
                        Get.to(RestaurantScreen(restaurantData: restaurantList?[index]));
                      },
                    );
                  },
                ),
              ),
        
            ],
          ),
        ),
      
    );
  }
}
