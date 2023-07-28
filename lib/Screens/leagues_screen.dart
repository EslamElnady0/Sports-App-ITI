import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Cubits/Leagues%20Cubit/leagues_cubit.dart';
import 'package:sports_app/Shared/widgets/league_container.dart';

class LeaguesScreen extends StatefulWidget {
  final String countryId;
  final String countryName;
  final String countryLogo;
  const LeaguesScreen(
      {super.key,
      required this.countryId,
      required this.countryName,
      required this.countryLogo});

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
                        image: NetworkImage(widget.countryLogo))),
              ))
        ],
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
            return AnimationLimiter(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: leaguesList!.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1500),
                      child: FadeInAnimation(
                        curve: Curves.bounceIn,
                        child: SlideAnimation(
                          horizontalOffset: MediaQuery.of(context).size.width,
                          child: LeagueContainer(
                            leaguesList: leaguesList,
                            index: index,
                          ),
                        ),
                      ),
                    );
                  }),
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
