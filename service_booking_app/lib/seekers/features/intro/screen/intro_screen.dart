import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_button.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_register_with_social_media_container.dart';
import 'package:service_booking_app/seekers/features/auth/login/screen/login_screen.dart';
import 'package:service_booking_app/seekers/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';
import 'package:service_booking_app/seekers/utils/app_string.dart';
import 'package:service_booking_app/seekers/utils/dimensions.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';
import '../../../utils/images.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(
          children: [
            const SizedBox(
              height: Dimensions.paddingSizeExtremeLarge,
            ),
            SizedBox(
                height: Dimensions.introImageHeight,
                width: Dimensions.introImageWidth,
                child: Image.asset(Images.introImage)),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            const Text(
              AppString.introText,
              style: styleExtraBold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Column(
              children: [
                CustomRegisterWithSocialMediaContainer(
                  iconName: FontAwesomeIcons.facebook,
                  text: AppString.continue_with_Facebook,
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                CustomRegisterWithSocialMediaContainer(
                  iconName: FontAwesomeIcons.google,
                  text: AppString.continue_with_Google,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                CustomRegisterWithSocialMediaContainer(
                  iconName: FontAwesomeIcons.apple,
                  text: AppString.continue_with_Apple,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeThirty,
                ),
                Text(
                  AppString.or,
                  style: styleBold.copyWith(
                      fontSize: 18,
                      height: 1.40,
                      letterSpacing: 0.20,
                      color: AppColors.introOrColor),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeExtraLarge,
                ),
                InkWell(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: CustomButton(
                      buttonText: AppString.sign_In_With_Password,
                    )),
                const SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.dont_have_an_account,
                      style: styleBold.copyWith(
                        color: AppColors.subTitleColor,
                        fontSize: Dimensions.fontSizeDefault,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        child: Text(
                          AppString.sign_UP,
                          style: styleBold.copyWith(
                              fontSize: 18,
                              height: 1.40,
                              letterSpacing: 0.20,
                              color: AppColors.primary),
                        ))
                  ],
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
