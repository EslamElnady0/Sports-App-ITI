import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sports_app/Data/Models/Leagues/result.dart';

import '../../Screens/teams_top_scorers_screen.dart';
import '../../constants/constants.dart';

class LeagueContainer extends StatelessWidget {
  final List<Result> leaguesList;
  final int index;

  const LeagueContainer({
    super.key,
    required this.leaguesList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 3)],
          color: componentsBackgroundColor),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: TeamsAndScorersScreen(
                      leagueLogo: leaguesList[index].leagueLogo!,
                      leagueId: leaguesList[index].leagueKey.toString(),
                      leagueName: leaguesList[index].leagueName!),
                  type: PageTransitionType.bottomToTop));
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(leaguesList[index].leagueLogo!),
        ),
        title: Text(
          leaguesList[index].leagueName!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
