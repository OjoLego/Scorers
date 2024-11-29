import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/match_stats/match_stats_event.dart';
import 'package:scorers/bloc/match_stats/match_stats_state.dart';
import 'package:scorers/data/repository/match_stats_repository.dart';

class MatchStatsBloc extends Bloc<MatchStatsEvent, MatchStatsState> {
  final MatchStatsRepository repository;

  MatchStatsBloc(this.repository) : super(MatchStatsInitial()) {
    on<FetchMatchStats>((event, emit) async {
      emit(MatchStatsLoading());
      try {
        final data = await repository.fetchMatchStats();
        emit(MatchStatsLoaded(data));
      } catch (e) {
        emit(MatchStatsError('Failed to fetch data'));
      }
    });
  }
}
