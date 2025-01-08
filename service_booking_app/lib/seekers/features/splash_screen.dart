import 'package:flutter/material.dart';

import '../utils/app_string.dart';
import '../utils/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(AppString.logoText, style: styleExtraBold),
        ),
      ],
    ));
  }
}
