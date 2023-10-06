import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splashIconSize: 500.00,
          splashTransition: SplashTransition.fadeTransition,
          splash: pngLogoPath,
          nextScreen: const HomeScreen()),
    );
  }
}
