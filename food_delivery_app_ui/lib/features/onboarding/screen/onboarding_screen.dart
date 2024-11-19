import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/features/registration/signin/screen/signin_screen.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.off(const SigninScreen());
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    var pageDecoration = PageDecoration(
      titleTextStyle:
          const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: Dimensions.fontSizeFourteen,
      ),
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColor.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,

      pages: [
        PageViewModel(
          title: "All your favorites",
          body:
              "Get all your loved foods, in one once place, you just place the order, we do the test",
          image: _buildImage(Images.onBoarding1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Order from choosen chef",
          body:
              "Get all your loved foods, in one once place, you just place the order, we do the test",
          image: _buildImage(Images.onBoarding2),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Free delivery offer",
            body:
                "Get all your loved foods, in one once place, you just place the order, we do the test",
            image: _buildImage(Images.onBoarding3),
            decoration: pageDecoration),
      ],

      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.grey,
      ),
      done: const Text('Done',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: AppColor.orange)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xfff9e1ce),
        activeSize: Size(22.0, 10.0),
        activeColor: AppColor.orange,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
