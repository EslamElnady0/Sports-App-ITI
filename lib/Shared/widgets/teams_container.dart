import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sports_app/Screens/players_screen.dart';

import '../../Data/Models/teams/result.dart';
import '../../constants/constants.dart';

class TeamsContainer extends StatelessWidget {
  final TeamResult result;
  const TeamsContainer({
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: PlayersScreen(
                  teamLogo: result.teamLogo!,
                  teamName: result.teamName!,
                  teamId: result.teamKey.toString(),
                ),
                type: PageTransitionType.fade));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: componentsBackgroundColor,
            boxShadow: const [BoxShadow(blurRadius: 5)]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 10),
          child: Column(
            children: [
              Image.network(
                result.teamLogo!,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://www.seekpng.com/png/full/28-289657_espn-soccer-team-logo-default.png",
                    height: height * 0.08,
                    width: width * 0.18,
                  );
                },
                height: height * 0.08,
                width: width * 0.18,
              ),
              const Spacer(),
              Center(
                child: FittedBox(
                  child: Text(
                    result.teamName!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
