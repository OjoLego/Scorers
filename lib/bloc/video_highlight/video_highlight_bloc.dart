import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/video_highlight/video_highlight_event.dart';
import 'package:scorers/bloc/video_highlight/video_highlight_state.dart';
import 'package:scorers/data/repository/video_highlight_repository.dart';

class VideoHighlightBloc
    extends Bloc<VideoHighlightEvent, VideoHighlightState> {
  final VideoHighlightRepository repository;

  VideoHighlightBloc(this.repository) : super(VideoHighlightInitial()) {
    on<FetchVideoHighlight>((event, emit) async {
      emit(VideoHighlightLoading());
      try {
        final data = await repository.fetchVideoHighlight();
        emit(VideoHighlightLoaded(data));
      } catch (e) {
        emit(VideoHighlightError('Failed to fetch data'));
      }
    });
  }
}
