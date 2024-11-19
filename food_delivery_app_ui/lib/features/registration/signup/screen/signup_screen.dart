import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_container_icon.dart';
import '../../../../common/widget/custom_text_field.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../signin/screen/signin_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                  height: Dimensions.paddingSizeFifteen,
                ),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text("Please sign up to get start",
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
                left: Dimensions.paddingSizeTwenty,
                right: Dimensions.paddingSizeTwenty),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radiusTwenty),
                  topRight: Radius.circular(Dimensions.radiusTwenty)),
              color: AppColor.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomTextField(
                      hintText: "Name", title: "Name", isSuffix: false),
                  const CustomTextField(
                      hintText: "Email", title: "Email", isSuffix: false),
                  const CustomTextField(
                      hintText: "Password", title: "Password", isSuffix: true),
                  const CustomTextField(
                      hintText: "Re-type Password",
                      title: "Re-type Password",
                      isSuffix: true),
                  const SizedBox(
                    height: Dimensions.marginSizeTen,
                  ),
                  InkWell(
                      onTap: () {
                        Get.off(const SigninScreen());
                      },
                      child: const CustomButton(buttonText: "SIGN UP")),
                  const SizedBox(
                    height: Dimensions.marginSizeTen,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
