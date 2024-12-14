import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/routes/routes.dart';
import 'package:task_management/screen/dashboard_screen.dart';
import 'package:task_management/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

      home: FutureBuilder(
          future: _checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData && snapshot.data == true) {
              return DashboardScreen(); // Show Dashboard if user is logged in
            } else {
              return LoginScreen(); // Show Login if user is not logged in
            }
          },
      ),

     // initialRoute: RoutesName.loginScreen,
      getPages: AppRoutes.appRoutes() ,
    );
  }
  // Check if user is logged in and if "remember me" is checked
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = prefs.getBool('remember_me') ?? false;  // Default to false
    String? token = prefs.getString('token');  // Get the token from SharedPreferences

    // If "remember me" is true and token exists, return true to go to Dashboard
    if (rememberMe && token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;  // Otherwise, return false to show Login screen
    }
  }

}

