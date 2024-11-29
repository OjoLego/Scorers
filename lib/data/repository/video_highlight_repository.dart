import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scorers/data/models/video_highlight_model.dart';

class VideoHighlightRepository {
  Future<VideoHighlightModel> fetchVideoHighlight() async {
    final String response =
        await rootBundle.loadString('assets/videoHighlight.json');
    final data = jsonDecode(response);
    return VideoHighlightModel.fromJson(data);
  }
}
