part of 'countries_cubit.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesSuccess extends CountriesState {
  final Countries response;
  CountriesSuccess({required this.response});
}

class CountriesFailure extends CountriesState {}

class CountriesResult extends CountriesState {}
