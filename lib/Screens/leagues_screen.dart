import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubits/Leagues%20Cubit/leagues_cubit.dart';
import 'package:sports_app/Data/Cubits/Star%20Cubit/star_cubit.dart';
import 'package:sports_app/constants/constants.dart';

class LeaguesScreen extends StatefulWidget {
  final String countryId;
  const LeaguesScreen({super.key, required this.countryId});

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
      appBar: AppBar(),
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
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: const BoxDecoration(
                            boxShadow: [BoxShadow(blurRadius: 3)],
                            color: componentsBackgroundColor),
                        child: ListTile(
                          trailing: IconButton(
                              onPressed: () {
                                context.read<StarCubit>().changeStar();
                              },
                              icon: Icon(
                                context.read<StarCubit>().isStarred
                                    ? Icons.star_border_outlined
                                    : Icons.star,
                                color: const Color.fromARGB(255, 230, 176, 2),
                              )),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(leaguesList[index].leagueLogo!),
                          ),
                          title: Text(
                            leaguesList[index].leagueName!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
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
