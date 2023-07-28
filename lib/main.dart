import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubits/Leagues%20Cubit/leagues_cubit.dart';
import 'package:sports_app/Data/Cubits/Star%20Cubit/star_cubit.dart';
import 'package:sports_app/Data/Cubits/Teams/teams_cubit.dart';
import 'package:sports_app/Data/Cubits/Top%20Scorers/top_scorers_cubit.dart';
import 'package:sports_app/Data/Cubits/players/players_cubit.dart';
import 'package:sports_app/constants/constants.dart';

import 'Data/Cubits/Countries Cubit/countries_cubit.dart';
import 'Screens/countries_screen.dart';

main() {
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
        BlocProvider(create: (context) => StarCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: componentsBackgroundColor,
                titleTextStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        home: const CountriesScreen(),
      ),
    );
  }
}
