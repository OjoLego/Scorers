import 'package:scorers/data/models/incidents_model.dart';

abstract class IncidentsState {}

class IncidentsInitial extends IncidentsState {}

class IncidentsLoading extends IncidentsState {}

class IncidentsLoaded extends IncidentsState {
  final IncidentsModel incidentsModel;

  IncidentsLoaded(this.incidentsModel);
}

class IncidentsError extends IncidentsState {
  final String message;

  IncidentsError(this.message);
}
