import 'package:scorers/data/models/momentum_model.dart';

abstract class MomentumState {}

class MomentumInitial extends MomentumState {}

class MomentumLoading extends MomentumState {}

class MomentumLoaded extends MomentumState {
  final MomentumModel momentumModel;

  MomentumLoaded(this.momentumModel);
}

class MomentumError extends MomentumState {
  final String message;

  MomentumError(this.message);
}
