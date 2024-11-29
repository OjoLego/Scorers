import 'package:scorers/data/models/best_player_model.dart';

abstract class BestPlayerState {}

class BestPlayerInitial extends BestPlayerState {}

class BestPlayerLoading extends BestPlayerState {}

class BestPlayerLoaded extends BestPlayerState {
  final BestPlayerModel bestPlayerModel;

  BestPlayerLoaded(this.bestPlayerModel);
}

class BestPlayerError extends BestPlayerState {
  final String message;

  BestPlayerError(this.message);
}
