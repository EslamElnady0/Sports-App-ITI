part of 'teams_cubit.dart';

@immutable
abstract class TeamsState {}

class TeamsInitial extends TeamsState {}

class TeamsLoading extends TeamsState {}

class TeamsSuccess extends TeamsState {
  final Teams response;
  TeamsSuccess({required this.response});
}

class TeamsFailure extends TeamsState {}
