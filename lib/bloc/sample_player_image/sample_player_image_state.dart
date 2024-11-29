import 'package:scorers/data/models/sample_player_image_model.dart';

abstract class SamplePlayerImageState {}

class SamplePlayerImageInitial extends SamplePlayerImageState {}

class SamplePlayerImageLoading extends SamplePlayerImageState {}

class SamplePlayerImageLoaded extends SamplePlayerImageState {
  final SamplePlayerImageModel samplePlayerImageModel;

  SamplePlayerImageLoaded(this.samplePlayerImageModel);
}

class SamplePlayerImageError extends SamplePlayerImageState {
  final String message;

  SamplePlayerImageError(this.message);
}
