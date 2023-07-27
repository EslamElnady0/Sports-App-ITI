import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubits/Leagues%20Cubit/leagues_cubit.dart';
import 'package:sports_app/Data/Cubits/Star%20Cubit/star_cubit.dart';
import 'package:sports_app/Shared/league_container.dart';

class LeaguesScreen extends StatefulWidget {
  final String countryId;
  final String countryName;
  const LeaguesScreen(
      {super.key, required this.countryId, required this.countryName});

  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  @override
  void initState() {
    context.read<LeaguesCubit>().getAllLeagues(widget.countryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: BlocBuilder<LeaguesCubit, LeaguesState>(
        builder: (context, state) {
          if (state is LeaguesLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is LeaguesSuccess) {
            var leaguesList = state.response.result;
            return BlocBuilder<StarCubit, StarState>(
              builder: (context, state) {
                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: leaguesList!.length,
                    itemBuilder: (context, index) {
                      return LeagueContainer(
                          leaguesList: leaguesList,
                          index: index,
                          leagueId: leaguesList[index].leagueKey.toString(),
                          leagueName: leaguesList[index].leagueName!);
                    });
              },
            );
          } else {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<LeaguesCubit>()
                        .getAllLeagues(widget.countryId);
                  },
                  child: const Text("Try again")),
            );
          }
        },
      ),
    );
  }
}
