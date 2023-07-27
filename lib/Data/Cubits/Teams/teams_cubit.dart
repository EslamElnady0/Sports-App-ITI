import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Repositries/teams_repo.dart';

import '../../Models/teams/teams.dart';

part 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit() : super(TeamsInitial());

  void getAllTeams(String leagueId) {
    emit(TeamsLoading());
    TeamsRepo().getAllTeams(leagueId).then((value) {
      if (value != null) {
        emit(TeamsSuccess(response: value));
      } else {
        emit(TeamsFailure());
        print("request failed");
      }
    });
  }
}
