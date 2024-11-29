import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/incidents/incidents_event.dart';
import 'package:scorers/bloc/incidents/incidents_state.dart';
import 'package:scorers/data/repository/incidents_repository.dart';

class IncidentsBloc extends Bloc<IncidentsEvent, IncidentsState> {
  final IncidentsRepository repository;

  IncidentsBloc(this.repository) : super(IncidentsInitial()) {
    on<FetchIncidents>((event, emit) async {
      emit(IncidentsLoading());
      try {
        final data = await repository.fetchIncidents();
        emit(IncidentsLoaded(data));
      } catch (e) {
        emit(IncidentsError('Failed to fetch data'));
      }
    });
  }
}
