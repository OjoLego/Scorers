import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/best_player/best_player_event.dart';
import 'package:scorers/bloc/best_player/best_player_state.dart';
import 'package:scorers/data/repository/best_player_repository.dart';

class BestPlayerBloc extends Bloc<BestPlayerEvent, BestPlayerState> {
  final BestPlayerRepository repository;

  BestPlayerBloc(this.repository) : super(BestPlayerInitial()) {
    on<FetchBestPlayer>((event, emit) async {
      emit(BestPlayerLoading());
      try {
        final data = await repository.fetchBestPlayer();
        emit(BestPlayerLoaded(data));
      } catch (e) {
        emit(BestPlayerError('Failed to fetch data'));
      }
    });
  }
}
