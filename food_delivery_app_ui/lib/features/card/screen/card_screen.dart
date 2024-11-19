import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/common/widget/custom_button.dart';
import 'package:food_delivery_app_ui/common/widget/custom_text_field.dart';
import 'package:food_delivery_app_ui/features/category/food_product/model/food_product_data.dart';
import 'package:food_delivery_app_ui/features/payment/screen/payment_screen.dart';
import 'package:get/get.dart';

import '../../../common/widget/custom_app_bar.dart';
import '../../../utils/app_color.dart';
import '../widget/custom_card_list_single_container_widget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key, this.foodProductData, this.price});

  final FoodProductData? foodProductData; // Nullable field for product data
  final double? price; // Nullable price field

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late double price;
  late double amount;
  late int quantity;
  late String name;
  late String image;

  @override
  void initState() {
    super.initState();

    // Initialize variables with safe fallbacks
    price = widget.price ?? 0.0;
    amount = widget.foodProductData?.productPrice ?? 0.0;
    quantity = widget.foodProductData?.quantity ?? 1;
    name = widget.foodProductData?.productName ?? 'Unknown';
    image = widget.foodProductData?.image ?? '';
  }

  @override
  Widget build(BuildContext context) {
    // Create a list of food products with fallback for missing data
    List<FoodProductData> foodProductData = [
      FoodProductData(
        productName: name,
        image: image,
        productPrice: amount,
        quantity: quantity,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
                  child: Column(
                    children: [
                      CustomAppBar(
                        leadingBGColor: AppColor.darkBlueTwo,
                        leadingIcon: Icons.arrow_back_ios_new,
                        leadingIconColor: AppColor.white,
                        title: "Cart",
                        titleColor: AppColor.white,
                        actionText: "Done",
                        actiontextColor: AppColor.green,
                        onTapButton: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(height: 5),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: foodProductData.length,
                        itemBuilder: (context, index) {
                          return CustomCardListSingleContainerWidget(
                            quantity: foodProductData[index].quantity ?? 1,
                            amount: foodProductData[index].productPrice ?? 0.0,
                            name: foodProductData[index].productName ?? 'Unknown',
                            image: foodProductData[index].image ?? '',
                            size: 14,
                            onValueChanged: (value) {
                              setState(() {
                                // If null, fallback to 1
                                quantity = value;
                                amount = price * quantity;
                              });
                            },
                            onTapCancel: () {
                              setState(() {
                                // Handle cancellation logic (if required)
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 6,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  color: AppColor.white
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextField(
                        title: "Delivery Address",
                        hintText: "Dhaka,BD", isSuffix: false),
                    const SizedBox(height: 5,),
                    Text("Total : \$$amount", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          Get.to(PaymentScreen(amount: amount,));
                        },
                        child: const CustomButton(buttonText: "PLACE ORDER")
                    )
                  ],
                ),
              )
          )

          // List of Cart Items

        ],
      ),
    );
  }
}
