import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/routes/routes_name.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.weatherScreen,
      getPages: AppRoutes.appRoutes() ,
    );
  }
}
