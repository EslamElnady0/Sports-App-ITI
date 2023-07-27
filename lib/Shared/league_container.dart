import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Screens/teams_screen.dart';
import '../constants/constants.dart';

class LeagueContainer extends StatelessWidget {
  final List leaguesList;
  final int index;
  final String leagueId;
  final String leagueName;
  const LeagueContainer(
      {super.key,
      required this.leaguesList,
      required this.index,
      required this.leagueId,
      required this.leagueName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 3)],
          color: componentsBackgroundColor),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child:
                      TeamsScreen(leagueId: leagueId, leagueName: leagueName),
                  type: PageTransitionType.bottomToTop));
        },
        trailing: IconButton(
            onPressed: () {
              // context.read<StarCubit>().isFavourited =
              //     List.filled(leaguesList.length, true);
              // context.read<StarCubit>().changeStar(index);
              // print(context.read<StarCubit>().isFavourited);
            },
            icon: const Icon(
              Icons.star_border_outlined,
              // context.read<StarCubit>().isFavourited[index]?
              //     Icons.star_border_outlined
              //     : Icons.star,
              color: Color.fromARGB(255, 230, 176, 2),
            )),
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
