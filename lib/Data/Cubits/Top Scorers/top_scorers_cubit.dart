import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/Top%20Scorers/top_scorers.dart';
import 'package:sports_app/Data/Repositries/top_scorers.dart';

part 'top_scorers_state.dart';

class TopScorersCubit extends Cubit<TopScorersState> {
  TopScorersCubit() : super(TopScorersInitial());

  void getTopScorers(String leagueId) {
    emit(TopScorersLoading());

    TopScorersRepo().getTopScorers(leagueId).then((value) {
      if (value != null) {
        emit(TopScorersSuccess(response: value));
      } else {
        emit(TopScorersFailure());
      }
    });
  }
}
