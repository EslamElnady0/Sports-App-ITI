import 'package:flutter/material.dart';
import 'package:sports_app/Screens/data%20screens/Tabbar/Tabbar%20views/teams_screen.dart';
import 'package:sports_app/Screens/data%20screens/Tabbar/Tabbar%20views/top_scorers_screen.dart';

class TeamsAndScorersScreen extends StatefulWidget {
  final String leagueId;
  final String leagueName;
  final String leagueLogo;
  const TeamsAndScorersScreen(
      {super.key,
      required this.leagueId,
      required this.leagueName,
      required this.leagueLogo});

  @override
  State<TeamsAndScorersScreen> createState() => _TeamsAndScorersScreenState();
}

class _TeamsAndScorersScreenState extends State<TeamsAndScorersScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.leagueName),
          centerTitle: true,
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: 5),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.leagueLogo))),
                ))
          ],
          bottom: TabBar(tabs: [
            SizedBox(
                height: height * 0.05,
                child: const Center(child: Text("Teams"))),
            SizedBox(
                height: height * 0.05,
                child: const Center(child: Text("Top Scorers")))
          ]),
        ),
        body: TabBarView(children: [
          TeamsScreen(leagueId: widget.leagueId),
          TopScorersScreen(leagueId: widget.leagueId),
        ]),
      ),
    );
  }
}
