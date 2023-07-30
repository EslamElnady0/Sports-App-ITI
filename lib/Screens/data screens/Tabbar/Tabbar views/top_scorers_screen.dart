import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Cubits/Top%20Scorers/top_scorers_cubit.dart';
import 'package:sports_app/Shared/widgets/custom_list_container.dart';

class TopScorersScreen extends StatefulWidget {
  final String leagueId;
  const TopScorersScreen({super.key, required this.leagueId});

  @override
  State<TopScorersScreen> createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  @override
  void initState() {
    context.read<TopScorersCubit>().getTopScorers(widget.leagueId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopScorersCubit, TopScorersState>(
      builder: (context, state) {
        if (state is TopScorersLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state is TopScorersSuccess) {
          var topScorersList = state.response.result;
          return AnimationLimiter(
            child: topScorersList == null
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
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: topScorersList.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1500),
                        child: FadeInAnimation(
                          curve: Curves.bounceIn,
                          child: SlideAnimation(
                            horizontalOffset: MediaQuery.of(context).size.width,
                            child: CustomListContainer(
                                subtitle: Text(
                                  topScorersList[index].teamName!,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                onTap: () {},
                                leading: "",
                                trailing:
                                    topScorersList[index].goals.toString(),
                                playerName: topScorersList[index].playerName ??
                                    "Unknown"),
                          ),
                        ),
                      );
                    },
                  ),
          );
        } else {
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  context
                      .read<TopScorersCubit>()
                      .getTopScorers(widget.leagueId);
                },
                child: const Text("Try again")),
          );
        }
      },
    );
  }
}
