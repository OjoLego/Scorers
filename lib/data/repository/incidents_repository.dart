import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scorers/data/models/incidents_model.dart';

class IncidentsRepository {
  Future<IncidentsModel> fetchIncidents() async {
    final String response =
        await rootBundle.loadString('assets/incidents.json');
    final data = jsonDecode(response);
    return IncidentsModel.fromJson(data);
  }
}
