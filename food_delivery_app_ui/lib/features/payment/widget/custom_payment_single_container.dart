import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/utils/app_color.dart';

class CustomPaymentSingleContainer extends StatelessWidget {
  const CustomPaymentSingleContainer({super.key, required this.paymentIcon, required this.paymentTypeName});

  final IconData paymentIcon;
  final String paymentTypeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.whiteThree
            ),
            child: Icon(paymentIcon, size: 25,),
          ),
          Text(paymentTypeName)
        ],
      ),
    );
  }
}
