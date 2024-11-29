import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scorers/data/models/momentum_model.dart';

class MomentumRepository {
  Future<MomentumModel> fetchMomentum() async {
    final String response = await rootBundle.loadString('assets/momentum.json');
    final data = jsonDecode(response);
    return MomentumModel.fromJson(data);
  }
}
