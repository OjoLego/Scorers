import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scorers/data/models/match_model.dart';

class MatchRepository {
  Future<MatchModel> fetchMatch() async {
    final String response = await rootBundle.loadString('assets/match.json');
    final data = jsonDecode(response);
    return MatchModel.fromJson(data);
  }
}
