import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/common/widget/custom_button.dart';
import 'package:food_delivery_app_ui/features/home/screen/home_screen.dart';
import 'package:get/get.dart';

import '../../../utils/images.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Centers content vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Images.congratulation),
              ),
              const SizedBox(height: 20),
              const Text(
                "Congratulation!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 10),
              const Text(
                "You successfully made a payment,\n enjoy our service!!",
                textAlign: TextAlign.center, // Align text in the center
                style: TextStyle(fontSize: 16),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.off(const HomeScreen());
                },
                child: const CustomButton(buttonText: "GO TO HOME PAGE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
