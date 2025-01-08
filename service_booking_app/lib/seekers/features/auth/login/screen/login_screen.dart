import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_button.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_icon_container.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_text_field.dart';
import 'package:service_booking_app/seekers/features/auth/forget_password/screen/forget_password_screen.dart';
import 'package:service_booking_app/seekers/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:service_booking_app/seekers/features/home/screen/home_screen.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: Dimensions.paddingSizeExtraLarge,
            ),
            const Text(AppString.logo, style: styleExtraBold),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Text(AppString.login_Your_Account,
                style: styleExtraBold.copyWith(
                    fontSize: 32,
                    height: 1.20,
                    color: AppColors.secondaryColor)),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Column(
                children: [
                  CustomTextField(
                      prefixIcon: Icons.email,
                      hintText: AppString.email,
                      isSuffix: false,
                      controller: emailController),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomTextField(
                      prefixIcon: Icons.lock,
                      hintText: AppString.password,
                      isSuffix: true,
                      controller: passwordController),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onChanged: (bool? newValue) {
                          setState(() {
                            rememberMe = newValue ?? false;
                          });
                        },
                      ),
                      Text(
                        AppString.rememberMe,
                        style: styleBold.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: Dimensions.fontSizeDefault),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(HomeScreen());
                      },
                      child: CustomButton(
                        buttonText: AppString.signIn,
                      )),
                  const SizedBox(
                    height: Dimensions.paddingSizeTwenty,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(ForgetPasswordScreen());
                      },
                      child: Text(
                        AppString.forgetPassword,
                        style: styleBold.copyWith(
                            color: AppColors.primary,
                            fontSize: Dimensions.fontSizeSixteen,
                            height: 1.40),
                      )),
                  const SizedBox(
                    height: Dimensions.paddingSizeExtraLarge,
                  ),
                  Text(
                    AppString.or_continue_with,
                    style: styleBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,
                        color: AppColors.subTitleColor,
                        height: 1.40),
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeExtraLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconContainer(
                        iconName: FontAwesomeIcons.facebook,
                        color: AppColors.blue,
                      ),
                      const SizedBox(
                        width: Dimensions.paddingSizeSmall,
                      ),
                      CustomIconContainer(
                        iconName: FontAwesomeIcons.google,
                        color: AppColors.red,
                      ),
                      const SizedBox(
                        width: Dimensions.paddingSizeSmall,
                      ),
                      CustomIconContainer(
                        iconName: FontAwesomeIcons.apple,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeTwenty,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.dont_have_an_account,
                        style: styleNormal.copyWith(
                            color: AppColors.subTitleColor, fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child: Text(
                            AppString.sign_UP,
                            style: styleBold.copyWith(
                                color: AppColors.primary, fontSize: 14),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
