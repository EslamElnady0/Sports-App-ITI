import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../Models/Leagues/leagues.dart';
import '../../Repositries/leagues_repo.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  LeaguesCubit() : super(LeaguesInitial());

  void getAllLeagues(String countryId) {
    emit(LeaguesLoading());
    LeaguesRepo().getAllLeagues(countryId).then((value) {
      if (value != null) {
        emit(LeaguesSuccess(response: value));
      } else {
        emit(LeaguesFailure());
        debugPrint("request failed");
      }
    });
  }
}
