import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Cubits/players/players_cubit.dart';
import 'package:sports_app/Shared/widgets/custom_list_container.dart';
import 'package:sports_app/Shared/widgets/search_text_field.dart';

import '../../Data/Models/Data Models/players/result.dart';
import '../../Shared/methods/player_dialog.dart';

class PlayersScreen extends StatefulWidget {
  final String teamId;
  final String teamName;
  final String teamLogo;
  const PlayersScreen(
      {required this.teamLogo,
      super.key,
      required this.teamId,
      required this.teamName});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Result>? filteredList = [];
  void searchItems(List<Result>? playersList, String value) {
    filteredList = playersList!
        .where((element) =>
            element.playerName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    context.read<PlayersCubit>().getTeamPlayer(widget.teamId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teamName),
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
                    image:
                        DecorationImage(image: NetworkImage(widget.teamLogo))),
              ))
        ],
      ),
      body: BlocBuilder<PlayersCubit, PlayersState>(
        builder: (context, state) {
          if (state is PlayersLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is PlayersSuccess) {
            var playersList = state.respose.result;
            return playersList == null
                ? const AnimationConfiguration.synchronized(
                    duration: Duration(milliseconds: 1500),
                    child: FadeInAnimation(
                      curve: Curves.easeIn,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Unfortunately, There is nothing to display :(",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5),
                          child: SearchTextField(
                            controller: searchController,
                            query: "player",
                            onChanged: (String value) {
                              searchItems(playersList, value);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: AnimationLimiter(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(5),
                                itemCount: searchController.text.isEmpty
                                    ? playersList.length
                                    : filteredList!.length,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    child: FadeInAnimation(
                                      curve: Curves.bounceIn,
                                      child: SlideAnimation(
                                          horizontalOffset:
                                              MediaQuery.of(context).size.width,
                                          child: searchController.text.isEmpty
                                              ? CustomListContainer(
                                                  onTap: () {
                                                    playerDialog(context,
                                                        playersList, index);
                                                  },
                                                  trailing: playersList[index]
                                                      .playerType!,
                                                  playerName: playersList[index]
                                                      .playerName!,
                                                  leading: playersList[index]
                                                      .playerImage)
                                              ///////////////////////////////////////////////////////////////////////////////////
                                              : CustomListContainer(
                                                  onTap: () {
                                                    playerDialog(context,
                                                        filteredList!, index);
                                                  },
                                                  trailing: filteredList![index]
                                                      .playerType!,
                                                  playerName:
                                                      filteredList![index]
                                                          .playerName!,
                                                  leading: filteredList![index]
                                                      .playerImage)),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  );
          } else {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<PlayersCubit>().getTeamPlayer(widget.teamId);
                  },
                  child: const Text("Try again")),
            );
          }
        },
      ),
    );
  }
}
