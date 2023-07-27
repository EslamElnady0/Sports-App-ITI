import 'package:flutter/material.dart';

class TeamsScreen extends StatefulWidget {
  final String leagueId;
  final String leagueName;
  const TeamsScreen(
      {super.key, required this.leagueId, required this.leagueName});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
