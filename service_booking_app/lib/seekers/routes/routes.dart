import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:service_booking_app/seekers/features/auth/create_new_password/screen/create_new_passport_screen.dart';
import 'package:service_booking_app/seekers/features/auth/fill_profile/screen/fill_profile_screen.dart';
import 'package:service_booking_app/seekers/features/auth/forget_password/screen/forget_password_screen.dart';
import 'package:service_booking_app/seekers/features/auth/login/screen/login_screen.dart';
import 'package:service_booking_app/seekers/features/auth/otp/screen/otp_screen.dart';
import 'package:service_booking_app/seekers/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:service_booking_app/seekers/features/calender_screen/screen/calender_screen.dart';
import 'package:service_booking_app/seekers/features/chat_screen/screen/chat_screen.dart';
import 'package:service_booking_app/seekers/features/chat_screen/screen/chatting_screen.dart';
import 'package:service_booking_app/seekers/features/event_screen/screen/event_screen.dart';
import 'package:service_booking_app/seekers/features/event_screen/screen/feature_event_screen.dart';
import 'package:service_booking_app/seekers/features/home/screen/home_screen.dart';
import 'package:service_booking_app/seekers/features/intro/screen/intro_screen.dart';
import 'package:service_booking_app/seekers/features/invitation_screen/screen/invitation_screen.dart';
import 'package:service_booking_app/seekers/features/nav_bar_screen/nav_bar_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/edit_profile_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/help_center_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/notification_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/privacy_policy_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/review_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/seeker_companion_profile_screen.dart';
import 'package:service_booking_app/seekers/features/splash_screen.dart';
import 'package:service_booking_app/seekers/routes/routes_name.dart';

import '../features/event_screen/screen/even_detail_screen.dart';



class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.getSplashScreen(),
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RoutesName.getIntroScreen(),
      page: () => IntroScreen(),
    ),
    GetPage(
      name: RoutesName.getLoginScreen(),
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesName.getSignUpScreen(),
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RoutesName.getForgetPasswordScreen(),
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: RoutesName.getOtpScreen(),
      page: () => OtpScreen(),
    ),
    GetPage(
      name: RoutesName.getCreateNewPasswordScreen(),
      page: () => CreateNewPassportScreen(),
    ),
    GetPage(
      name: RoutesName.getFillProfileScreen(),
      page: () => FillProfileScreen(),
    ),
    GetPage(
      name: RoutesName.getHomeScreen(),
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutesName.getNavBarScreen(),
      page: () => NavBarScreen(),
    ),
    GetPage(
      name: RoutesName.getSeekerProfileScreen(),
      page: () => SeekerCompanionProfileScreen(),
    ),
    GetPage(
      name: RoutesName.getCalenderScreen(),
      page: () => CalenderScreen(),
    ),
    GetPage(
      name: RoutesName.getInvitationScreen(),
      page: () => InvitationScreen(),
    ),
    GetPage(
      name: RoutesName.getEventScreen(),
      page: () => EventScreen(),
    ),
    GetPage(
      name: RoutesName.getFeatureEventScreen(),
      page: () => FeatureEventScreen(),
    ),
    GetPage(
      name: RoutesName.getEventDetailScreen(),
      page: () => EvenDetailScreen(),
    ),
    GetPage(
      name: RoutesName.getChatScreen(),
      page: () => ChatScreen(),
    ),
    GetPage(
      name: RoutesName.getChattingScreen(),
      page: () => ChattingScreen(),
    ),
    GetPage(
      name: RoutesName.getEditProfileScreen(),
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: RoutesName.getNotificationScreen(),
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: RoutesName.getHelpCenterScreen(),
      page: () => HelpCenterScreen(),
    ),
    GetPage(
      name: RoutesName.getPrivacyPolicyScreen(),
      page: () => PrivacyPolicyScreen(),
    ),
    GetPage(
      name: RoutesName.getReviewScreen(),
      page: () => ReviewScreen(),
    ),



  ];
}