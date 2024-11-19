import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/features/registration/forget_password/screen/verification_code_screen.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_container_icon.dart';
import '../../../../common/widget/custom_text_field.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                        "Forget Password",
                        style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text("Please sign in to your existing account",
                          style: TextStyle(color: AppColor.white)),
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
                const CustomTextField(
                    hintText: "Please write your email",
                    title: "Email",
                    isSuffix: false),
                const SizedBox(
                  height: Dimensions.marginSizeFifteen,
                ),
                InkWell(
                    onTap: () {
                      Get.to(const VerificationCodeScreen());
                    },
                    child: const CustomButton(buttonText: "SEND CODE")),
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
