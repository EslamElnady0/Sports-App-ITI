import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Data/Cubits/Leagues%20Cubit/leagues_cubit.dart';
import 'package:sports_app/Data/Cubits/Teams/teams_cubit.dart';
import 'package:sports_app/Data/Cubits/Top%20Scorers/top_scorers_cubit.dart';
import 'package:sports_app/Data/Cubits/players/players_cubit.dart';
import 'package:sports_app/Screens/openeing/splash_screen.dart';
import 'package:sports_app/constants/constants.dart';

import 'Data/Cubits/Countries Cubit/countries_cubit.dart';

int? isViewed;
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  isViewed = prefs.getInt('onBoard');

  runApp(const SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountriesCubit()),
        BlocProvider(create: (context) => LeaguesCubit()),
        BlocProvider(create: (context) => TeamsCubit()),
        BlocProvider(create: (context) => TopScorersCubit()),
        BlocProvider(create: (context) => PlayersCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: kComponentsBackgroundColor,
                titleTextStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        home: const SplashScreen(),
      ),
    );
  }
}
