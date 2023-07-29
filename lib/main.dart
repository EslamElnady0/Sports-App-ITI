// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/screens/splash_screen.dart';
import 'package:sports_app/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isviewed != 0 ? SplashAnimated() : home());
  }
}



// MaterialApp(home: SplashAnimated());