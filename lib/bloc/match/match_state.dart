import 'package:scorers/data/models/match_model.dart';

abstract class MatchState {}

class MatchInitial extends MatchState {}

class MatchLoading extends MatchState {}

class MatchLoaded extends MatchState {
  final MatchModel matchModel;

  MatchLoaded(this.matchModel);
}

class MatchError extends MatchState {
  final String message;

  MatchError(this.message);
}
