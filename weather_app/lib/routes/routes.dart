
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app/features/splash_screen.dart';
import 'package:weather_app/features/weather/screen/weather_screen.dart';
import 'package:weather_app/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
        name: RoutesName.weatherScreen,
        page: () => const WeatherScreen()
    ),
    GetPage(
        name: RoutesName.splashScreen,
        page: () => const SplashScreen()
    ),
  ];
}