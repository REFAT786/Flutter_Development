import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/features/category/food_product/model/food_product_data.dart';
import 'package:food_delivery_app_ui/features/category/foood_category/model/food_category_data.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_app_bar.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../utils/app_color.dart';
import '../../../card/screen/card_screen.dart';
import '../widget/custom_picture_details_container_widget.dart';
import '../widget/custom_quantity_widget.dart';
import '../widget/custom_size_widget.dart';

class FoodProductScreen extends StatefulWidget {
  const FoodProductScreen({super.key, this.foodCategoryData,this.foodProductData, this.price});
  final FoodCategoryData ?foodCategoryData;
  final FoodProductData ?foodProductData;
  final double? price;

  @override
  State<FoodProductScreen> createState() => _FoodProductScreenState();
}

class _FoodProductScreenState extends State<FoodProductScreen> {
  double restaurantReview =  4.5;

  String shippingStatus = "Free";

  double durationTime = 30;
  int quantity=1;


  String productName = "Pizza Calzone European";
  double? amount, price;
  int? selectedSize;
  //bool isClicked = false;
  List<int>sizeNumber = [
    10,14,16
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount = widget.foodCategoryData?.startingPrice!;
    price = widget.foodCategoryData?.startingPrice!;
  }

  @override
  Widget build(BuildContext context) {
    String image = widget.foodCategoryData!.foodCategoryImage!;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, left: 25, right: 25, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                onTapButton: (){
                  Get.back();
                },
                leadingBGColor: AppColor.whiteTwo,
                leadingIcon: Icons.arrow_back_ios_new,
                leadingIconColor: AppColor.darkBlue,
                title: "Details", titleColor: AppColor.black),
            const SizedBox(height: 20,),
            CustomPictureDetailsContainerWidget(foodTypeImage: image,),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    )
                  ]
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text("Uttara Coffe House")
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text(productName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const Text("ksjbfsf nsdjnfosnf oiihfosofn iosdfo oihsdof oihsdfho oisdfoi ioosdof jnsdofn"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
            Row(
              children: [
                const Text("Size : "),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: sizeNumber.length,
                    itemBuilder: (context, index) {
                      return CustomSizeWidget(
                        isClicked: selectedSize == sizeNumber[index], // Check if the size is selected
                        sizeNumber: sizeNumber[index],
                        onTap: () {
                          setState(() {
                            selectedSize = sizeNumber[index]; // Update the selected size
                          });
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("INGREDIENTS"),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent.withOpacity(0.4),
                        radius: 22,
                        child: const Icon(Icons.emoji_food_beverage_outlined,color: Colors.red,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent.withOpacity(0.4),
                        radius: 22,
                        child: const Icon(Icons.rice_bowl,color: Colors.red,size: 15,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent.withOpacity(0.4),
                        radius: 22,
                        child: const Icon(Icons.local_pizza,color: Colors.red,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent.withOpacity(0.4),
                        radius: 22,
                        child: const Icon(Icons.cake,color: Colors.red,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent.withOpacity(0.4),
                        radius: 22,
                        child: const Icon(Icons.emoji_food_beverage_outlined,color: Colors.red,),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.whiteThree,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text("\$ $amount", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                    //Spacer(),
                    CustomQuantityWidget(quantity: quantity, onValueChanged: (int value) {
                      setState(() {
                        quantity = value;
                        amount = (price! * quantity);
                      });
                    }, )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  Get.off(CardScreen(foodProductData: FoodProductData(
                    duration: durationTime,
                    deliveryType: shippingStatus,
                    image: image,
                    productName: productName,
                    productPrice: amount,
                    quantity: quantity
                  ),price: price,));
                  },
                child: const CustomButton(buttonText: "Add To Card"))
          ],
        ),
      ),
    );
  }
}
