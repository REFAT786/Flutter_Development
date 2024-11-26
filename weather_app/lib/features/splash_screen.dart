import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../util/images/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff122f2d),
      body: Stack(
        children: [
          Image.asset(Images.splashImage, fit: BoxFit.cover,),
          const Positioned(
            bottom: 140,
              left: 0,
              right: 0,
              child: SpinKitWave(
                color: Colors.white,
                size: 50.0,
              )
          ),
        ],
      )
    );
  }
}
