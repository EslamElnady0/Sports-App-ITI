import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Cubits/Teams/teams_cubit.dart';
import 'package:sports_app/Data/Models/teams/result.dart';
import '../Shared/widgets/search_text_field.dart';
import '../Shared/widgets/teams_container.dart';

class TeamsScreen extends StatefulWidget {
  final String leagueId;

  const TeamsScreen({super.key, required this.leagueId});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  void initState() {
    context.read<TeamsCubit>().getAllTeams(widget.leagueId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  query: "team",
                  onChanged: (String) {},
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
                      children: teamsList.asMap().entries.map((e) {
                        int index = e.key;
                        var value = e.value;
                        return AnimationConfiguration.staggeredGrid(
                          duration: const Duration(milliseconds: 1500),
                          position: index,
                          columnCount: 3,
                          child: FadeInAnimation(
                            curve: Curves.easeIn,
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.easeIn,
                              horizontalOffset:
                                  MediaQuery.of(context).size.width,
                              verticalOffset:
                                  MediaQuery.of(context).size.height,
                              child: TeamsContainer(
                                result: value,
                              ),
                            ),
                          ),
                        );
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
