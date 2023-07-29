import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Cubits/players/players_cubit.dart';
import 'package:sports_app/Shared/widgets/custom_container.dart';
import 'package:sports_app/Shared/widgets/search_text_field.dart';

import '../Shared/methods/player_dialog.dart';

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
            var playerList = state.respose.result;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SearchTextField(
                    query: "player",
                    onChanged: (String) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: AnimationLimiter(
                      child: ListView.builder(
                          itemCount: playerList!.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1500),
                              child: FadeInAnimation(
                                curve: Curves.bounceIn,
                                child: SlideAnimation(
                                  horizontalOffset:
                                      MediaQuery.of(context).size.width,
                                  child: ScaleAnimation(
                                    duration: const Duration(milliseconds: 900),
                                    curve: Curves.easeInCubic,
                                    child: CustomContainer(
                                        onTap: () {
                                          playerDialog(
                                              context, playerList, index);
                                        },
                                        trailing: playerList[index].playerType!,
                                        playerName:
                                            playerList[index].playerName!,
                                        leading: playerList[index].playerImage),
                                  ),
                                ),
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
