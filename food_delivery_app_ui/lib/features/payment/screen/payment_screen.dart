import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/common/widget/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common/widget/custom_button.dart';
import 'package:food_delivery_app_ui/features/payment/screen/congratulation_screen.dart';
import 'package:food_delivery_app_ui/features/payment/widget/custom_payment_single_container.dart';
import 'package:food_delivery_app_ui/utils/app_color.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
    PaymentScreen({super.key, this.amount});

   final double? amount;

   final List<dynamic>paymentType = [
    [Icons.monetization_on, "Cash"],
    [Icons.cases, "Visa"],
    [Icons.card_giftcard_sharp, "MasterCard"],
    [Icons.monetization_on, "Cash"],
    [Icons.cases, "Visa"],
    [Icons.card_giftcard_sharp, "MasterCard"],

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                onTapButton: (){
                  Get.back();
                },
                leadingBGColor: AppColor.whiteTwo,
                leadingIcon: Icons.arrow_back_ios_new,
                leadingIconColor: Colors.black,
                title: "Payment",
                titleColor: Colors.black),
            const SizedBox(height: 15,),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: paymentType.length,
                  itemBuilder: (context, index) {
                    return CustomPaymentSingleContainer(
                        paymentIcon: paymentType[index][0],
                        paymentTypeName: paymentType[index][1]);
                  },
              ),
            ),
            const Spacer(),
            Text("Total : \$$amount", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 10,),
            InkWell(
                onTap: (){
                  Get.to(const CongratulationScreen());
                },
                child: const CustomButton(buttonText: "PAY & CONFIRM"))

          ],
        ),
      ),
    );
  }
}
