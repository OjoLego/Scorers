import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scorers/data/models/sample_player_image_model.dart';

class SamplePlayerImageRepository {
  Future<SamplePlayerImageModel> fetchSamplePlayerImage() async {
    final String response =
        await rootBundle.loadString('assets/sample_player_image.json');
    final data = jsonDecode(response);
    return SamplePlayerImageModel.fromJson(data);
  }
}
