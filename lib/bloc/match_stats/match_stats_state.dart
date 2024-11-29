import 'package:scorers/data/models/match_stats_model.dart';

abstract class MatchStatsState {}

class MatchStatsInitial extends MatchStatsState {}

class MatchStatsLoading extends MatchStatsState {}

class MatchStatsLoaded extends MatchStatsState {
  final MatchStatsModel matchStats;

  MatchStatsLoaded(this.matchStats);
}

class MatchStatsError extends MatchStatsState {
  final String message;

  MatchStatsError(this.message);
}
