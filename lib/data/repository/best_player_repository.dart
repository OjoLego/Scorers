import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scorers/data/models/best_player_model.dart';

class BestPlayerRepository {
  Future<BestPlayerModel> fetchBestPlayer() async {
    final String response =
        await rootBundle.loadString('assets/bestplayer.json');
    final data = jsonDecode(response);
    return BestPlayerModel.fromJson(data);
  }
}
