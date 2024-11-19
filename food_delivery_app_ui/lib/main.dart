import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:food_delivery_app_ui/routes/routes_name.dart';
import 'package:food_delivery_app_ui/utils/app_constants.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
