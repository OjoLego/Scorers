import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/sample_player_image/sample_player_image_event.dart';
import 'package:scorers/bloc/sample_player_image/sample_player_image_state.dart';
import 'package:scorers/data/repository/sample_player_image_repository.dart';

class SamplePlayerImageBloc
    extends Bloc<SamplePlayerImageEvent, SamplePlayerImageState> {
  final SamplePlayerImageRepository repository;

  SamplePlayerImageBloc(this.repository) : super(SamplePlayerImageInitial()) {
    on<FetchSamplePlayerImage>((event, emit) async {
      emit(SamplePlayerImageLoading());
      try {
        final data = await repository.fetchSamplePlayerImage();
        emit(SamplePlayerImageLoaded(data));
      } catch (e) {
        emit(SamplePlayerImageError('Failed to fetch data'));
      }
    });
  }
}
