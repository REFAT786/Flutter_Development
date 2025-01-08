import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/features/auth/login/screen/login_screen.dart';
import 'package:service_booking_app/seekers/features/home/screen/home_screen.dart';
import 'package:service_booking_app/seekers/utils/app_string.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_icon_container.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String _selectedOption = "Seeker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Dimensions.paddingSizeExtremeLarge,),
            const Text(AppString.logo, style: styleExtraBold,),
            const SizedBox(height: Dimensions.paddingSizeSmall,),
            Text(AppString.create_Your_Account,style: styleExtraBold.copyWith(
                fontSize: 32,
                height: 1.20,
                color: AppColors.secondaryColor)),
            const SizedBox(height: Dimensions.paddingSizeSmall,),
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Column(
                children: [
                  CustomTextField(prefixIcon: Icons.email, hintText: AppString.email, isSuffix: false, controller: emailController),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  CustomTextField(prefixIcon: Icons.lock, hintText: AppString.password, isSuffix: true, controller: passwordController),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  CustomTextField(prefixIcon: Icons.lock, hintText: AppString.confirm_Password, isSuffix: true, controller: confirmPasswordController),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: AppString.seeker,
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                          Text(AppString.seeker, style: styleBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.secondary),),
                        ],
                      ),
                      const SizedBox(width: Dimensions.paddingSizeTwenty),
                      Row(
                        children: [
                          Radio<String>(
                            value: AppString.plusOne,
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                          Text(AppString.plusOne, style: styleBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.secondary)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){Get.to(HomeScreen());},
                      child: CustomButton(buttonText: AppString.sign_UP,)
                  ),
                  const SizedBox(height: 30,),
                  Text(AppString.or_continue_with, style: styleBold.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      color: AppColors.subTitleColor,
                      height: 1.40),
                  ),
                  SizedBox(height: Dimensions.paddingSizeExtraLarge,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconContainer(iconName: FontAwesomeIcons.facebook, color: Colors.blue,),
                      const SizedBox(width: Dimensions.paddingSizeSmall,),
                      CustomIconContainer(iconName: FontAwesomeIcons.google, color: Colors.red,),
                      const SizedBox(width: Dimensions.paddingSizeSmall,),
                      CustomIconContainer(iconName: FontAwesomeIcons.apple, color: Colors.black,),
        
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppString.already_have_an_account, style: styleNormal.copyWith(color: AppColors.subTitleColor, fontSize: 14),),
                      TextButton(onPressed: (){Get.to(const LoginScreen());}, child: Text(AppString.signIn, style: styleBold.copyWith(color: AppColors.primary, fontSize: 14),))
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
