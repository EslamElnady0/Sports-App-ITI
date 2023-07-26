import 'package:flutter/material.dart';

class SportsApp extends StatelessWidget {
  const SportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountriesScreen(),
    );
  }
}

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
