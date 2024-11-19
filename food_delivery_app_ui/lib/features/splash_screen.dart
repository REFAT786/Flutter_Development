import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';
import '../utils/images.dart';
import 'onboarding/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.appLogo,
            fit: BoxFit.cover,
            height: 100,
            width: 200,
            alignment: Alignment.center,
          ),
          const SpinKitChasingDots(
            color: AppColor.black,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
