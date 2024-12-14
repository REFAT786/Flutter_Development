
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_management/routes/routes_name.dart';

import '../screen/create_task_screen.dart';
import '../screen/dashboard_screen.dart';
import '../screen/login_screen.dart';
import '../screen/profile_edit_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/signup_screen.dart';
import '../screen/task_edit_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
        name: RoutesName.loginScreen,
        page: () =>  LoginScreen()
    ),GetPage(
        name: RoutesName.signupScreen,
        page: () =>  SignupScreen()
    ), GetPage(
        name: RoutesName.dashboardScreen,
        page: () =>  DashboardScreen()
    ),GetPage(
        name: RoutesName.profileScreen,
        page: () =>  ProfileScreen()
    ),GetPage(
        name: RoutesName.profileEditScreen,
        page: () =>  ProfileEditScreen()
    ),GetPage(
        name: RoutesName.createTaskScreen,
        page: () =>  CreateTaskScreen()
    ),GetPage(
        name: RoutesName.taskEditScreen,
        page: () =>  TaskEditScreen()
    ),

  ];
}