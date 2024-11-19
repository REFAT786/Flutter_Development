import 'package:food_delivery_app_ui/features/card/screen/card_screen.dart';
import 'package:food_delivery_app_ui/features/category/food_product/screen/food_product_screen.dart';
import 'package:food_delivery_app_ui/features/category/foood_category/screen/food_category_screen.dart';
import 'package:food_delivery_app_ui/features/category/restaurant/screen/restaurant_category_screen.dart';
import 'package:food_delivery_app_ui/features/category/restaurant/screen/restaurant_screen.dart';
import 'package:food_delivery_app_ui/features/home/screen/home_screen.dart';
import 'package:food_delivery_app_ui/features/onboarding/screen/onboarding_screen.dart';
import 'package:food_delivery_app_ui/features/payment/screen/payment_screen.dart';
import 'package:food_delivery_app_ui/features/registration/forget_password/screen/forget_password_screen.dart';
import 'package:food_delivery_app_ui/features/registration/forget_password/screen/verification_code_screen.dart';
import 'package:food_delivery_app_ui/features/registration/signin/screen/signin_screen.dart';
import 'package:food_delivery_app_ui/features/registration/signup/screen/signup_screen.dart';
import 'package:food_delivery_app_ui/features/splash_screen.dart';
import 'package:food_delivery_app_ui/routes/routes_name.dart';
import 'package:get/get.dart';

import '../features/profile/screen/profile_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen()
        ),
        GetPage(
            name: RoutesName.onboardingScreen,
            page: () => const OnboardingScreen()
        ),
        GetPage(
            name: RoutesName.signinScreen,
            page: () => const SigninScreen()
        ),
        GetPage(
            name: RoutesName.forgetPasswordScreen,
            page: () => const ForgetPasswordScreen()
        ),
        GetPage(
            name: RoutesName.getVerificationScreen(),
            page: () => const VerificationCodeScreen()
        ),
        GetPage(
            name: RoutesName.signupScreen,
            page: () => const SignupScreen()
        ),
        GetPage(
            name: RoutesName.homeScreen,
            page: () => const HomeScreen()
        ),
    GetPage(
        name: RoutesName.restaurantCategoryScreen,
        page: () => const RestaurantCategoryScreen()
    ),
    GetPage(
        name: RoutesName.restaurantScreen,
        page: () => const RestaurantScreen()
    ),
    GetPage(
        name: RoutesName.foodCategoryScreen,
        page: () => const FoodCategoryScreen()
    ),
    GetPage(
        name: RoutesName.foodProductScreen,
        page: () => const FoodProductScreen()
    ),
    GetPage(
        name: RoutesName.cardScreen,
        page: () => const CardScreen()
    ),
    GetPage(
        name: RoutesName.profileScreen,
        page: () => ProfileScreen()
    ),
    GetPage(
        name: RoutesName.paymentScreen,
        page: () => PaymentScreen()
    ),

      ];
}
