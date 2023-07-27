import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/Countries/countries.dart';
import 'package:sports_app/Data/Repositries/countries_repo.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  void getAllCountries() {
    emit(CountriesLoading());
    CountriesRepo().getCountries().then((value) {
      if (value != null) {
        emit(CountriesSuccess(response: value));
      } else {
        emit(CountriesFailure());
        debugPrint("request failed");
      }
    });
  }
}
