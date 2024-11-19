import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_container_icon.dart';
import '../../../../common/widget/custom_pin_box_widget.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../signin/screen/signin_screen.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.paddingSizeFifteen,
                right: Dimensions.paddingSizeFifteen,
                top: Dimensions.paddingSizeTwentyFive,
                bottom: Dimensions.paddingSizeThirty),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const CustomContainerIcon(
                        bgColor: AppColor.white,
                        icon: Icons.arrow_back_ios_new,
                        iconColor: AppColor.darkBlue)),
                const SizedBox(
                  height: Dimensions.marginSizeThirty,
                ),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        "Verification",
                        style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text("We have send a code to your email",
                          style: TextStyle(color: AppColor.white)),
                      Text("demo@gmail.com",
                          style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(
                top: Dimensions.paddingSizeFifteen,
                left: Dimensions.paddingSizeTwenty,
                right: Dimensions.paddingSizeTwenty),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: AppColor.white,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPinBoxWidget(),
                    CustomPinBoxWidget(),
                    CustomPinBoxWidget(),
                    CustomPinBoxWidget(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Get.off(const SigninScreen());
                    },
                    child: const CustomButton(buttonText: "VERIFY")),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
