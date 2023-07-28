part of 'top_scorers_cubit.dart';

@immutable
abstract class TopScorersState {}

class TopScorersInitial extends TopScorersState {}

class TopScorersLoading extends TopScorersState {}

class TopScorersSuccess extends TopScorersState {
  final TopScorers response;
  TopScorersSuccess({required this.response});
}

class TopScorersEmptyList extends TopScorersState {}

class TopScorersFailure extends TopScorersState {}
