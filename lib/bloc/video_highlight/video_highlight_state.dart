import 'package:scorers/data/models/video_highlight_model.dart';

abstract class VideoHighlightState {}

class VideoHighlightInitial extends VideoHighlightState {}

class VideoHighlightLoading extends VideoHighlightState {}

class VideoHighlightLoaded extends VideoHighlightState {
  final VideoHighlightModel videoHighlightModel;

  VideoHighlightLoaded(this.videoHighlightModel);
}

class VideoHighlightError extends VideoHighlightState {
  final String message;

  VideoHighlightError(this.message);
}
