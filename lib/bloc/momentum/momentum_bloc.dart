import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/momentum/momentum_event.dart';
import 'package:scorers/bloc/momentum/momentum_state.dart';
import 'package:scorers/data/repository/momentum_repository.dart';

class MomentumBloc extends Bloc<MomentumEvent, MomentumState> {
  final MomentumRepository repository;

  MomentumBloc(this.repository) : super(MomentumInitial()) {
    on<FetchMomentum>((event, emit) async {
      emit(MomentumLoading());
      try {
        final data = await repository.fetchMomentum();
        emit(MomentumLoaded(data));
      } catch (e) {
        emit(MomentumError('Failed to fetch data'));
      }
    });
  }
}
