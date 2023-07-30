part of 'players_cubit.dart';

@immutable
abstract class PlayersState {}

class PlayersInitial extends PlayersState {}

class PlayersLoading extends PlayersState {}

class PlayersSuccess extends PlayersState {
  final Players respose;
  PlayersSuccess({required this.respose});
}

class PlayersFailure extends PlayersState {}
