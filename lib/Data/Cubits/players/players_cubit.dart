import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/Data%20Models/players/players.dart';
import 'package:sports_app/Data/Repositries/players_repo.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  void getTeamPlayer(String teamId) {
    emit(PlayersLoading());

    PlayersRepo().getTeamPlayers(teamId).then((value) {
      if (value != null) {
        emit(PlayersSuccess(respose: value));
      } else {
        emit(PlayersFailure());
      }
    });
  }
}
