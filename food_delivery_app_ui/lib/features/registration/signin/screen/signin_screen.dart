import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/features/home/screen/home_screen.dart';
import 'package:food_delivery_app_ui/features/registration/signin/model/signin_data.dart';
import 'package:food_delivery_app_ui/common/widget/custom_button.dart';
import 'package:food_delivery_app_ui/common/widget/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_social_media_icon_button.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../forget_password/screen/forget_password_screen.dart';
import '../../signup/screen/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String title = "Email";
  String hintText = "Please write your email";
  bool isSuffix = false;
  bool value = false;

  String buttonText = "LOG IN";

  List<SigninData> textFieldList = [
    SigninData(
      title: "Email",
      hintText: "Please enter your email",
      isSuffix: false,
    ),
    SigninData(
      title: "Password",
      hintText: "Please enter your password",
      isSuffix: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                left: Dimensions.paddingSizeFifteen,
                right: Dimensions.paddingSizeFifteen,
                top: Dimensions.paddingSizeTwentyFive,
                bottom: Dimensions.paddingSizeThirty),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.marginSizeThirty,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Sign In",
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
                  ListView.builder(
                    shrinkWrap: true,
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: textFieldList.length,
                    itemBuilder: (context, index) {
                      return CustomTextField(
                        title: textFieldList[index].title!,
                        hintText: textFieldList[index].hintText!,
                        isSuffix: textFieldList[index].isSuffix!,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: value,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  value = newValue!;
                                });
                              }),
                          const Text("Remember me"),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            Get.to(const ForgetPasswordScreen());
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(color: AppColor.orange),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Get.off(() => const HomeScreen());
                      },
                      child: CustomButton(buttonText: buttonText)),
                  const SizedBox(
                    height: Dimensions.marginSizeTwenty,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?   "),
                      InkWell(
                          onTap: () {
                            Get.to(const SignupScreen());
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(color: AppColor.orange),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.marginSizeTwenty,
                  ),
                  const Text("Or"),
                  const SizedBox(
                    height: Dimensions.marginSizeTen,
                  ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSocialMediaIconButton(
                            icon: Icons.facebook,
                            color: AppColor.white,
                            bgColor: AppColor.blue,
                          ),
                          SizedBox(
                            width: Dimensions.marginSizeTwenty,
                          ),
                          CustomSocialMediaIconButton(
                            icon: Icons.add_circle,
                            color: AppColor.white,
                            bgColor: AppColor.sky,
                          ),
                          SizedBox(
                            width: Dimensions.marginSizeTwenty,
                          ),
                          CustomSocialMediaIconButton(
                            icon: Icons.ac_unit,
                            color: AppColor.white,
                            bgColor: AppColor.darkBlue,
                          ),
                        ],
                      )

                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
