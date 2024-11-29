import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scorers/data/models/match_stats_model.dart';

class MatchStatsRepository {
  Future<MatchStatsModel> fetchMatchStats() async {
    final String response =
        await rootBundle.loadString('assets/match_stats.json');
    final data = jsonDecode(response);
    return MatchStatsModel.fromJson(data);
  }
}
