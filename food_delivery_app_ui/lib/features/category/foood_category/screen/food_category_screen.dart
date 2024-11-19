import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/features/category/foood_category/model/food_category_data.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_app_bar.dart';
import '../../../../utils/app_color.dart';
import '../../food_product/screen/food_product_screen.dart';
import '../widget/custom_all_category_food_single_container.dart';

class FoodCategoryScreen extends StatelessWidget {
  const FoodCategoryScreen({super.key, this.foodCategoryList});
  final List<FoodCategoryData>? foodCategoryList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                  title: "All Category",
                  titleColor: AppColor.black),
             // SizedBox(height: 5,),
              Expanded(
                child: GridView.builder(
                  itemCount: foodCategoryList?.length,
                  shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: 14/15,
                    ),
                    itemBuilder: (context, index) {
                      return CustomAllCategoryFoodSingleContainer(
                        foodImage: foodCategoryList![index].foodCategoryImage!,
                        foodName: foodCategoryList![index].foodCategoryName!,
                        price: foodCategoryList?[index].startingPrice,
                        onTapFoodCategory: () {
                          Get.to(FoodProductScreen(foodCategoryData: foodCategoryList?[index],) );
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
