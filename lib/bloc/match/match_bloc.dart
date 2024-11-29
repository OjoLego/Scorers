import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/match/match_state.dart';
import 'package:scorers/bloc/match/match_event.dart';
import 'package:scorers/data/repository/match_repository.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final MatchRepository repository;

  MatchBloc(this.repository) : super(MatchInitial()) {
    on<FetchMatch>((event, emit) async {
      emit(MatchLoading());
      try {
        final data = await repository.fetchMatch();
        emit(MatchLoaded(data));
      } catch (e) {
        emit(MatchError('Failed to fetch data'));
      }
    });
  }
}
