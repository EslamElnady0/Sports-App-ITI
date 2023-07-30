import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sports_app/Screens/data%20screens/home_screen.dart';
import 'package:sports_app/main.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(50.0),
            alignment: Alignment.center,
            child: AnimatedSplashScreen(
              splashIconSize: 400,
              backgroundColor: Colors.transparent,
              pageTransitionType: PageTransitionType.rightToLeft,
              splashTransition: SplashTransition.fadeTransition,
              splash: Image.asset(
                "assets/images/pngwing.com.png",
                height: 200,
              ),
              nextScreen: isViewed == 0 || isViewed == null
                  ? const OnBoardingScreen()
                  : const HomeScreen(),
              animationDuration: const Duration(seconds: 3),
            ),
          ),
        ],
      ),
    );
  }
}
