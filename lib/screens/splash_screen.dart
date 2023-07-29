import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// import '../main.dart';
import 'onboard_screen.dart';

class SplashAnimated extends StatelessWidget {
  const SplashAnimated({Key? key}) : super(key: key);

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
              nextScreen: OnBoard(),
              animationDuration: const Duration(seconds: 3),
            ),
          ),
        ],
      ),
    );
  }
}
// class Splash_Animated extends StatelessWidget {
//   const Splash_Animated({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        
            // body: Container(
//         child: AnimatedSplashScreen(
                // alignment: Alignment.center,
//             padding: EdgeInsetsDirectional.all(200.0),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/background1.jpg"),
//                 fit: BoxFit.cover,
//                 splashIconSize: 400,
//                 pageTransitionType: PageTransitionType.topToBottom,
//                 splashTransition: SplashTransition.sizeTransition,
//                 splash: const Image(
//                   image: AssetImage("assets/images/logo2.png"),
//                   height: 200,
//                 ),
//                 nextScreen: const SecondScreen(),
//                 // duration: 5000,
//                 animationDuration: const Duration(seconds: 2))));
//               ),
//             ),
//   }
// }
