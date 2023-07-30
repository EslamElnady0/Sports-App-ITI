import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Cubits/Teams/teams_cubit.dart';
import 'package:sports_app/Data/Models/Data%20Models/teams/result.dart';
import 'package:sports_app/Screens/data%20screens/players_screen.dart';
import 'package:sports_app/Shared/methods/grid_map_body.dart';
import '../../../../Shared/widgets/search_text_field.dart';
import '../../../../Shared/widgets/grid_container.dart';

class TeamsScreen extends StatefulWidget {
  final String leagueId;

  const TeamsScreen({super.key, required this.leagueId});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  TextEditingController searchController = TextEditingController();
  late List<TeamResult>? filteredList;

  void searchItems(List<TeamResult>? teamsList, String value) {
    filteredList = teamsList!
        .where((element) =>
            element.teamName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    context.read<TeamsCubit>().getAllTeams(widget.leagueId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<TeamsCubit, TeamsState>(builder: (context, state) {
      if (state is TeamsLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      } else if (state is TeamsSuccess) {
        List<TeamResult> teamsList = state.response.result!;
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SearchTextField(
                  controller: searchController,
                  query: "team",
                  onChanged: (String value) {
                    searchItems(teamsList, value);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: AnimationLimiter(
                  child: GridView.count(
                      padding: const EdgeInsets.all(5),
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1,
                      mainAxisSpacing: 5,
                      children: searchController.text.isEmpty
                          ? teamsList.asMap().entries.map((e) {
                              int index = e.key;
                              var value = e.value;
                              return gridMapBody(
                                  index,
                                  context,
                                  GridContainer(
                                    logo: value.teamLogo!,
                                    name: value.teamName!,
                                    imageHeight: height * 0.08,
                                    imageWidth: width * 0.18,
                                    nextScreen: PlayersScreen(
                                      teamLogo: value.teamLogo!,
                                      teamName: value.teamName!,
                                      teamId: value.teamKey.toString(),
                                    ),
                                  ));
                            }).toList()
                          : filteredList!.asMap().entries.map((e) {
                              int index = e.key;
                              var value = e.value;
                              return gridMapBody(
                                  index,
                                  context,
                                  GridContainer(
                                    logo: value.teamLogo!,
                                    name: value.teamName!,
                                    imageHeight: height * 0.08,
                                    imageWidth: width * 0.18,
                                    nextScreen: PlayersScreen(
                                      teamLogo: value.teamLogo!,
                                      teamName: value.teamName!,
                                      teamId: value.teamKey.toString(),
                                    ),
                                  ));
                            }).toList()),
                ),
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: ElevatedButton(
              onPressed: () {
                context.read<TeamsCubit>().getAllTeams(widget.leagueId);
              },
              child: const Text("Try again")),
        );
      }
    });
  }
}
